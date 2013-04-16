# coding: utf-8
require 'restclient'
require 'nokogiri'
require 'open-uri'
require 'logger'
require 'yaml'
require 'json'
#require 'pry'
#require 'pry-debugger'

MAX_RETRY_TIMES = 5
site_prefix = 'http://www.meilishuo.com'

storage_path = 'meilishuo/'
if !Dir.exist?(storage_path)
  Dir.mkdir(storage_path)
end

logger = Logger.new('running.log')

content_page = []
(0..67).each do |page|
  (0..7).each do |frame|
    puts "page:#{page} frame:#{frame}"
    list_link = "http://www.meilishuo.com/aj/getGoods/report?frame=#{frame}&page=#{page}"

    logger.info "list page: #{list_link}"

    retry_times = 0
    begin
      list_data = RestClient.get list_link
    rescue
      retry_times += 1
      retry if retry_times < MAX_RETRY_TIMES
    end
    if list_data.nil?
      logger.error "download list data error: #{list_link}"
      next
    end

    list_json = JSON::parse(list_data)
    if !list_json or !list_json["tInfo"]
      logger.error "parse list data error: #{list_data}"
      next
    end

    list_json["tInfo"].each do |content_json|
      content_id = content_json["twitter_id"]
      content_link = site_prefix + "/share/" + content_id
      content_title = content_json["twitter_htmlcontent"]
      content_image_id = content_json["twitter_images_id"]
      thumbnail_link = content_json["show_pic"]
      thumbnail_width = content_json["poster_width"]
      thumbnail_height = content_json["poster_height"]
      create_time = content_json["twitter_create_time"]

      item = {}
      item['content_id'] = content_id
      item['content_image_id'] = content_image_id
      item['content_link'] = content_link
      item['thumbnail_link'] = thumbnail_link
      item['thumbnail_width'] = thumbnail_width
      item['thumbnail_height'] = thumbnail_height

      logger.info "content page: #{content_link}"

      retry_times = 0
      begin
        content = Nokogiri::HTML(open(content_link))
      rescue
        retry_times += 1
        retry if retry_times < MAX_RETRY_TIMES
      end
      if content.nil?
        logger.error "download content page error: #{content_link}"
        next
      end

      begin
        image_link = content.css('.twitter_pic')[0]['src']
        #content_title = content.css('.twitter_context')[0].content
        #create_time = content.css('.tags')[0].content
      rescue
        logger.error "parse content page error: #{content_link}"
        next
      end
      if !image_link.index('http')
        image_link = site_prefix + image_link
      end

      item['image_link'] = image_link
      item['content_title'] = content_title
      item['create_time'] = create_time

      retry_times = 0
      begin
        thumb = RestClient.get(thumbnail_link)
      rescue
        retry_times += 1
        retry if retry_times < MAX_RETRY_TIMES
      end
      if thumb.nil?
        logger.error "download thumbnail image error: #{thumbnail_link}"
        next
      end
      thumbnail_image = "#{storage_path}mls_thumb_#{content_id}.jpg"
      item['thumbnail_image'] = thumbnail_image
      thumb_file = File.open(thumbnail_image, 'wb')
      thumb_file.syswrite(thumb)
      thumb_file.close

      retry_times = 0
      begin
        image = RestClient.get(image_link)
      rescue
        retry_times += 1
        retry if retry_times < MAX_RETRY_TIMES
      end
      if image.nil?
        logger.error "download content image error: #{image_link}"
        next
      end
      content_image = "#{storage_path}mls_#{content_id}.jpg"
      item['content_image'] = content_image
      image_file = File.open(content_image, 'wb')
      image_file.syswrite(image)
      image_file.close

      content_page << item

      sleep 1
    end
  end
end

out_file = File.open('meilishuo_page.yaml', 'w')
out_file.puts(content_page.to_yaml)
out_file.close


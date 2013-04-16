# coding: utf-8
require 'restclient'
require 'nokogiri'
require 'open-uri'
require 'logger'
require 'yaml'
#require 'pry'
#require 'pry-debugger'

MAX_RETRY_TIMES = 5
list_page_id = 1..57
site_prefix = 'http://gaoguai.net'

storage_path = 'gaoguai/'
if !Dir.exist?(storage_path)
  Dir.mkdir(storage_path)
end

logger = Logger.new('running.log')

content_page = []
count = 0
list_page_id.each do |id|
  count += 1
  puts "list page: #{count}"

  list_link = "http://gaoguai.net/manhua/yj/list26#{id}.html"
  logger.info "list page: #{list_link}"
  retry_times = 0
  begin
    doc = Nokogiri::HTML(open(list_link))
  rescue
    #logger.error "download list page error: #{list_link}"
    retry_times += 1
    retry if retry_times < MAX_RETRY_TIMES
  end
  if doc.nil?
    logger.error "download list page error: #{list_link}"
    next
  end
  sub_count = 0
  doc.css('.picList2 li').each do |li|
    sub_count += 1
    puts "content page: #{sub_count}"

    begin
      content_link = site_prefix + li.css('.img')[0]['href']
      content_title = li.css('.img img')[0]['title']
      thumbnail_link = site_prefix + li.css('.img img')[0]['src']
      create_time = li.css('span')[1].content
    rescue
      logger.error "parse list page error: #{li.children}"
      next
    end
    content_link =~ /(\d*)(\.html)/
    content_id = $1

    item = {}
    item['content_id'] = content_id
    item['content_link'] = content_link
    item['content_title'] = content_title
    item['thumbnail_link'] = thumbnail_link
    item['create_time'] = create_time

    logger.info "content page: #{content_link}"
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
    thumbnail_image = "#{storage_path}sxjt_thumb_#{content_id}.jpg"
    item['thumbnail_image'] = thumbnail_image
    thumb_file = File.open(thumbnail_image, 'wb')
    thumb_file.syswrite(thumb)
    thumb_file.close

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
      image_link = content.css('.artCon img')[0]['src']
    rescue
      logger.error "parse content page error: #{content_link}"
      next
    end
    if !image_link.index('http')
      image_link = site_prefix + image_link
    end
    item['image_link'] = image_link

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
    content_image = "#{storage_path}sxjt_#{content_id}.jpg"
    item['content_image'] = content_image
    image_file = File.open(content_image, 'wb')
    image_file.syswrite(image)
    image_file.close

    content_page << item

    sleep 0.5
  end
end

out_file = File.open('content_page.yaml', 'w')
out_file.puts(content_page.to_yaml)
out_file.close

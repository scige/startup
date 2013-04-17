# coding: utf-8

require 'yaml'

namespace :db do
  desc "add dressup articles to mysql"
  task :add_dressup_articles => :environment do
    index_begin = ENV['index_begin'].to_i
    index_end = ENV['index_end'].to_i
    mls_data = YAML.load_file("lib/tasks/dressup_page.yaml")
    mls_data[index_begin..index_end].each do |item|
      next if item["content_title"].nil?
      content_title = item["content_title"].strip
      next if content_title.empty?
      Article.create!(
        {
          :status => ARTICLE_STATUS_ON,
          :raw_id => item["content_id"],
          :category => ARTICLE_CATEGORY_DRESSUP,
          :title => content_title[0..13],
          :content => content_title,
          :thumb => item["thumbnail_image"],
          :thumb_width => item["thumbnail_width"],
          :thumb_height => item["thumbnail_height"],
          :image => item["content_image"],
          :like_count => 10,
          :click_count => 10
        }
      )
    end
  end
end

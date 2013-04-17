require 'yaml'

namespace :db do
  desc "add dressup articles to mysql"
  task :add_dressup_articles => :environment do
    index_begin = ENV['index_begin'].to_i
    index_end = ENV['index_end'].to_i
    mls_data = YAML.load_file("lib/tasks/test.yaml")
    mls_data[index_begin..index_end].each do |item|
      Article.create!(
        {
          :status => ARTICLE_STATUS_ON,
          :raw_id => item["content_id"],
          :category => ARTICLE_CATEGORY_DRESSUP,
          :title => item["content_title"][0..15],
          :content => item["content_title"],
          :thumb => item["thumbnail_image"],
          :thumb_width => item["thumbnail_width"],
          :thumb_height => item["thumbnail_height"],
          :image => item["content_image"],
          :like_count => 10,
          :click_count => 1
        }
      )
    end
  end
end

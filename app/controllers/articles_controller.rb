class ArticlesController < ApplicationController
    def index
        @articles = Article.where(:status=>ARTICLE_STATUS_ON).order("updated_at DESC").page(params[:page])
    end

    def show
        @article = Article.find_by_id(params[:id])
        @hot_articles = Article.find(:all,
                                     :conditions => "status=#{ARTICLE_STATUS_ON}",
                                     :order => "RANDOM()",
                                     :limit => 3)
        @article.update_attributes(:click_count => @article.click_count+1)
    end
end

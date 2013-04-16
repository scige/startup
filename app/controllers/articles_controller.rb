class ArticlesController < ApplicationController
    def index
        @articles = Article.where(:status=>ARTICLE_STATUS_ON).order("updated_at DESC").page(params[:page])
    end

    def show
        @article = Article.find_by_id(params[:id])
    end
end

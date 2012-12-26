class Admin::DealersController < ApplicationController
    before_filter :authenticate_super!

    def index
        @dealers = Dealer.all
    end

    def new
        @dealer = Dealer.new
    end

    def edit
        @dealer = Dealer.find(params[:id])
    end

    def create
        @dealer = Dealer.new(params[:dealer])
        if @dealer.save
            redirect_to admin_dealers_url
        else
            render "new"
        end
    end

    def update
        @dealer = Dealer.find(params[:id])
        if @dealer.update_attributes(params[:dealer])
            redirect_to admin_dealers_url
        else
            render "edit"
        end
    end

    def destroy
        @dealer = Dealer.find(params[:id])
        @dealer.destroy
        redirect_to admin_dealers_url
    end
end

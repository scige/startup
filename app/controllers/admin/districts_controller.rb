class Admin::DistrictsController < ApplicationController
    before_filter :authenticate_super!

    def index
        @districts = District.all
    end

    def new
        @district = District.new
    end

    def edit
        @district = District.find(params[:id])
    end

    def create
        @district = District.new(params[:district])
        if @district.save
            redirect_to admin_districts_url
        else
            render "new"
        end
    end

    def update
        @district = District.find(params[:id])
        if @district.update_attributes(params[:district])
            redirect_to admin_districts_url
        else
            render "edit"
        end
    end

    def destroy
        @district = District.find(params[:id])
        @district.destroy
        redirect_to admin_districts_url
    end
end

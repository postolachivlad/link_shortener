class LinksController < ApplicationController

    def create
        url = link_params[:original_url]
        shortener = Shortener.new(url)
        @link = shortener.save_link_record
    end

    private

    def link_params
        params.require(:link).permit(:original_url)
    end

end

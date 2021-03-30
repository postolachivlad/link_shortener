class LinksController < ApplicationController

    def create
        p params
        url = link_params[:original_url]
        shortener = Shortener.new(url)
        @link = shortener.save_link_record

        @link.persisted? ? (respond_to :js) : (render 'error.js.erb')
    end

    private

    def link_params
        params.require(:link).permit(:original_url)
    end

end

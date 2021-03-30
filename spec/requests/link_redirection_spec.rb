require "rails_helper"

RSpec.describe "Link redirection", type: :request do

    it "should redirect to the original URL for given shorten link" do

        url = "https://www.google.com/dude-where-is-my-car"
        shortener = Shortener.new(url)
        link = shortener.save_link_record

        get link.shortened_url
        expect(response).to redirect_to(link.original_url)
    end

end
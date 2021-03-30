require "rails_helper"

RSpec.describe LinksController, type: :controller do

    it "can shorten a link provided by a user" do
        request.env["HTTP_ACCEPT"] = "text/javascript"

        url = "https://www.google.com/dude-where-is-my-car"
        post :create, params: { link: { original_url: url} }
        link = assigns(:link)
        p link
    
        expect(link.original_url).to eq(url)
        expect(link.url_short_code.length).to eq(7)
        expect(link.valid?).to be(true)
        expect(link.persisted?).to be(true)
        expect(response).to render_template('create')
    end

end
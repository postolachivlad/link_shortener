require "rails_helper"

RSpec.describe Shortener do

    it "should create a 7 character loockupcode for each URL " do
        url = "https://www.google.com/dude-where-is-my-car"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end

    it "create a uniq lookup code for each URL" do 
        url = "https://www.google.com/dude-where-is-my-car"
        shortener = Shortener.new(url)
        code = shortener.lookup_code

        url = "https://www.google.com/dude-where-is-my-truck"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code
        expect(code).not_to eq(code_2)
    end

    it "save in db an URL with an uniq lookup code" do
        url = "https://www.google.com/dude-where-is-my-car"
        shortener = Shortener.new(url)
        short_link = shortener.save_link_record
        expect(short_link.valid?).to be(true)
        
        short_link_2 = shortener.save_link_record
        expect(short_link_2.valid?).to be(true)
    end

end
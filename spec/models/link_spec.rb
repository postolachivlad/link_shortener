require "rails_helper"

RSpec.describe Link do

    it "is valid when it has initial URL and lookup code" do
        link = Link.new(
            original_url: "https://www.google.com/dude-where-is-my-car",
            url_short_code: "a1b2c3d"
        )
        expect(link.valid?).to be(true)
    end

    it "is invalid if doesn't have an URL" do
        link = Link.new(
            url_short_code: "a1b2c3d"
        )
        expect(link.valid?).to be(false)
    end

    it "is invalid if doesn't have an lookup code" do
        link = Link.new(
            original_url: "https://www.google.com/dude-where-is-my-car"
        )
        expect(link.valid?).to be(false)
    end

    it "is invalid if lookup code already exist" do
        link_1 = Link.new(
            original_url: "https://www.google.com/dude-where-is-my-car",
            url_short_code: "a1b2c3d"
        )
        link_1.save

        link_2 = Link.new(
            original_url: "https://www.google.com/dude-where-is-my-bike",
            url_short_code: "a1b2c3d"
        )
        expect(link_2.valid?).to be(false)
    end

    it "is invalid if URL is not formated properly" do
        link = Link.new(
            original_url: "wingardiumleviosa",
            url_short_code: "a1b2c3d"
        )
        expect(link.valid?).to be(false)
    end

end
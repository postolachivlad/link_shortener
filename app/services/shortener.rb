class Shortener 

    attr_reader :url, :link_model

    def initialize(url, link_model = Link)
        @url = url
        @link_model = link_model
    end

    def save_link_record
        Link.create(original_url: url, url_short_code: lookup_code)
    end

    def lookup_code
        loop do
            short_code = get_fresh_short_code
            break short_code unless link_model.exists?(url_short_code: short_code)
        end
    end

    private

    def get_fresh_short_code
        SecureRandom.uuid[0..6]
    end
end
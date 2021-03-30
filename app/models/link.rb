class Link < ApplicationRecord

    validates :original_url, :url_short_code, presence: true
    validates :url_short_code, uniqueness: true
    validate :validate_url


    def validate_url
        begin
            uri = URI.parse(original_url)
            if uri.host.nil?
                errors.add(:original_url, "Invalid URL format")
            end
        rescue URI::InvalidURIError => e
        end
    end

    def shortened_url
        "http://localhost:3000/#{url_short_code}"
    end

end

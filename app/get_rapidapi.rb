require 'uri'
require 'net/http'
require 'openssl'

class GetRapidapi
    
    def initialize(city, country)

        url = URI("https://best-booking-com-hotel.p.rapidapi.com/booking/best-accommodation?cityName=#{city}&countryName=#{country}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["X-RapidAPI-Key"] = '96236abd81msh81c3ed074f9b021p1fd84djsnbadbe05b3a01'
        request["X-RapidAPI-Host"] = 'best-booking-com-hotel.p.rapidapi.com'

        response = http.request(request)
        puts response.read_body
    end

end
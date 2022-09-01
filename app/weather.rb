class Weather

    attr_accessor :suburb, :country

    def initialize(suburb, country)

        @suburb = suburb
        @country = country

        currentTime = Time.now

        access_key = '3a2022bcbfa9d6b3cdaff88beb02f100'

        url = 'http://api.weatherstack.com/current' + "?#{access_key}" + "&#{suburb},#{parse_country(country)}"

        get_requester = GetRequester.new()
        result = get_requester.parse_json

        puts result
    end

    def parse_country(country)
        result = country.split(" ")
        parsed = ""
        result.each do |r|
            parsed += "%20#{r}"
        end
        parsed
    end

end

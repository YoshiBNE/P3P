class Weather

    attr_accessor :suburb, :country

    def initialize(suburb, country)

        @suburb = suburb
        @country = country

        currentTime = Time.now

        access_key = '3a2022bcbfa9d6b3cdaff88beb02f100'
        url = "http://api.weatherstack.com/current?access_key=" + "#{access_key}" + "&query=" + "#{@suburb},#{parse_country(@country)}"

        get_requester = GetRequester.new(url)
        result = get_requester.parse_json

        current_weather = result["current"]
        puts "\n \n"
        puts "City/Suburb: #{result["location"]["name"]}"
        puts "Country: #{result["location"]["country"]}"
        puts "Current Weather Conditions\n"
        puts "Description: #{current_weather["weather_descriptions"]}"
        puts "Temperature: #{current_weather["temperature"]} degrees Celsius"
        puts "Humidity: #{current_weather["humidity"]}%"
        puts "UV-index: #{current_weather["uv_index"]}"
        puts "Wind Speed and Direction: #{current_weather["wind_speed"]} km/h in direction of #{current_weather["wind_dir"]}\n"
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

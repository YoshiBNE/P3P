class Greeting

    def initialize(name:)

        currentTime = Time.now.hour

        if currentTime > 4 && currentTime < 12
            puts "Good Morning, #{name}!!"
        elsif currentTime >= 12 && currentTime < 17
            puts "Good Afternoon, #{name}!!"
        else
            puts "Good Evening, #{name}!!"
        end

        puts "Welcome to my CLI application."

    end
end
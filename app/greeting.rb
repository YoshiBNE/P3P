class Greeting

    def initialize(first_name: first_name, last_name: last_name)

        currentTime = Time.now.hour

        if currentTime > 4 && currentTime < 12
            puts "Good Morning, #{first_name} #{last_name}!!"
        elsif currentTime >= 12 && currentTime < 17
            puts "Good Afternoon, #{first_name} #{last_name}!!"
        else
            puts "Good Evening, #{first_name} #{last_name}!!"
        end
            
        puts "Welcome to my CLI application."
    end
end
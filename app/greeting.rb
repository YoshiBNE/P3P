class Greeting

    def initialize(first_name: first_name, last_name: last_name)

        currentTime = Time.now.hour
        current_user = User.find_by_username(first_name: first_name, last_name: last_name)

        if current_user == nil
            puts "Hello!! It must be your first time! Nice to meet you!"
            current_user = User.create_new({first_name: first_name, last_name: last_name})
        end

        if currentTime > 4 && currentTime < 12
            puts "Good Morning, #{current_user.first_name}!!"
        elsif currentTime >= 12 && currentTime < 17
            puts "Good Afternoon, #{current_user.first_name}!!"
        else
            puts "Good Evening, #{current_user.first_name}!!"
        end
            
        puts "Welcome to my CLI application."
    end
end
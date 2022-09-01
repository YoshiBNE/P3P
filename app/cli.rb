class CLI 
    def initialize

        f_validation = false
        l_validation = false
        while f_validation == false
            if f_validation == false
                puts "Plese enter your first name."
                first_name = gets.strip
                if first_name == ""
                    puts "Invalid Input... Please try again."
                else
                    f_validation = true
                end
            end
        end

        while l_validation == false
            if l_validation == false
                puts "Please enter your last name."
                last_name = gets.strip
                if last_name == ""
                    puts "Invalid Input... Please try again."
                else
                    l_validation = true
                end
            end
        end
        
        current_user = User.find_by_username(first_name: first_name, last_name: last_name)

        if current_user == nil
            puts "Hello!! It must be your first time! Nice to meet you!"
            current_user = User.create_new({first_name: first_name, last_name: last_name})
        else
            puts "You are back again!!"
        end

        Greeting.new(first_name: first_name, last_name: last_name)

        # puts "#{current_user}" for debugging
        
        continue = 'y'
        validStatus = true

        while continue == 'y'
            if validStatus == true
                puts "What would you like to do today?"
                puts ""
                puts "1. Tell me know about yourself!"
                puts "2. Maybe time to sign a song! Find lyrics for you!"
                puts "3. Update your details"
                puts "4. Abort"
            end
            
            activity = gets.strip
            
            if activity == '1'
                puts "Activity 1"
                
                validStatus = true
            elsif activity == '2'
                puts "Weather Forcast"
                puts ""
                puts "In which suburb do you want to know about weather?"
                suburb = gets.strip
                puts "In which country?"
                country = gets.strip
                Weather.new(suburb, city)
                validStatus = true
            elsif activity == '3'
                puts "Let me know about you."
                validStatus = true
                # Profile.new(name: username)
            elsif activity == '4'
                puts "See you next time, #{current_user.first_name}!!"
                validStatus = true
                continue = 'N'
            else
                puts "INVALID INPUT VALUE"
                validStatus = false
            end

            if validStatus == false
                puts "Please type 1, 2, 3, or 4 and then press 'Enter'."
            elsif continue != 'N'
                puts "Do you want to continue? (y/N)"
                continue = gets.strip
                if continue != 'y' && continue != 'N'
                    while continue != 'y' && continue != 'N'
                        puts "Invalid Input. Please use 'y' or 'N'"
                        continue = gets.strip
                    end
                end
            end
        
        end



    end

end
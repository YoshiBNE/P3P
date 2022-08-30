class CLI 
    def initialize

        f_validation = false
        l_validation = false
        while f_validation == false || l_validation == false
            if f_validation == false
                puts "Plese enter your first name."
                first_name = gets.strip
                if first_name == ""
                    puts "Invalid Input... Please try again."
                else
                    f_validation = true
                end
            end

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
        
        Greeting.new(first_name: first_name, last_name: last_name)

        
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
                puts "Activity 2"
                validStatus = true
            elsif activity == '3'
                puts "Activity 3"
                validStatus = true
                # Profile.new(name: username)
            elsif activity == '4'
                puts "See you next time, #{username}!!"
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
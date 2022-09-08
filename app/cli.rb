class CLI 
    def initialize
        ################################################################################
        f_validation = false
        l_validation = false
        while f_validation == false
            if f_validation == false
                puts "Plese enter your first name."
                first_name = gets.strip
                if first_name == ""
                    begin
                        raise InputError
                    rescue InputError => error
                        puts error.message
                    end
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
                    begin
                        raise InputError
                    rescue InputError => error
                        puts error.message
                    end
                else
                    l_validation = true
                end
            end
        end
        ################################################################################
        current_user = User.find_by_username(first_name, last_name)

        if current_user == nil
            puts "Hi!! It must be your first time! Nice to meet you!"
            current_user = User.create_new({first_name: first_name, last_name: last_name})
        else
            puts "You are back again!!"
        end

        Greeting.new(first_name, last_name)

        ################################################################################
        ################################################################################
        ################################################################################
        
        continue = 'y'
        validStatus = true

        while continue == 'y'
            if validStatus == true
                puts "What would you like to do today?"
                puts ""
                puts "1. Tell me more about yourself!"
                puts "2. Weather Forcast"
                puts "3. Check your details"
                puts "4. Show All Users"
                puts "5. Show All Countries "
                puts "6. Abort"
            end
            
            activity = gets.strip

            ################################################################################
            if activity == '1'
                if current_user.birthday
                    ans = "nothing"
                    while ans != "y" && ans != "N"
                        puts "Is this your birthday??\n"
                        puts "#{current_user.birthday} (y/N)"
                        ans = gets.strip
                        if ans != "y" && ans != "N"
                            begin
                                raise InputError
                            rescue InputError => error
                                puts error.message
                            end
                        end
                    end
                end
                if current_user.birthday == nil || ans == "N"
                    puts "Please let me know your date of birth in DD/MM/YYYY format."
                    current_user.birthday = gets.strip
                    current_user.age = Age.user_age(current_user.birthday)
                end
                
                if current_user.suburb && current_user.country
                    ans = "nothing"
                    while ans != "y" && ans != "N"
                        puts "\nSuburb: #{current_user.suburb.name}  -- Country: #{current_user.country.name}"
                        puts "Is this correct information about where you live?"
                        ans = gets.strip
                        if ans != "y" && ans != "N"
                            begin
                                raise InputError
                            rescue InputError => error
                                puts error.message
                            end
                        end
                    end
                end
                if current_user.suburb == nil || current_user.country == nil || ans == "N"
                    puts "Please let me know which suburb and country your live in."
                    puts "Suburb:\n"
                    v = false
                    while v == false
                        suburb = gets.strip
                        if suburb == ""
                            begin
                                raise InputError
                            rescue InputError => error
                                puts error.message
                            end
                        else
                            v = true
                        end
                    end
                    current_suburb = Suburb.create_or_find(suburb)
                
                    v = false

                    puts "\n"
                    puts "Country:\n"

                    while v == false
                        country = gets.strip
                        if country == ""
                            begin
                                raise InputError
                            rescue InputError => error
                                puts error.message
                            end
                        else
                            v = true
                        end
                    end
                    current_country = Country.create_or_find(country)

                    current_user.suburb = current_suburb
                    current_user.country = current_country
                    current_suburb.country = current_country

                    current_suburb.save
                    current_user.save
                end
                
                validStatus = true
            ################################################################################
            ################################################################################
            elsif activity == '2'
                puts "Weather Forcast"
                puts ""
                cus = current_user.suburb
                cuc = current_user.country
                if cus != nil && cuc != nil
                    validator = false
                    puts "Do you want to know the weather of your local area (#{cus.name}, #{cuc.name})? (y/N)"
                    response = gets.strip
                    if response == "y"
                        Weather.new(cus.name, cuc.name)
                    end
                end
                if cus == nil || cuc == nil || response == "N"
                    puts "In which city/suburb do you want to know about weather?"
                    suburb = gets.strip
                    puts "In which country?"
                    country = gets.strip

                    Weather.new(suburb, country)
                end

                validStatus = true
            ################################################################################
            ################################################################################
            elsif activity == '3'
                puts "Your details"

                UserDetails.get_details(current_user)
                validStatus = true
            
            ################################################################################
            ################################################################################
            elsif activity == '4'
                puts "-- Names of users who have visited --\n"
                User.show_all
            ################################################################################
            ################################################################################
            elsif activity == '5'
                puts "-- Names of countries stored --\n"
                Country.show_all
                # Suburb.show_all
            ################################################################################
            ################################################################################
            elsif activity == '6'
                puts "See you next time, #{current_user.first_name}!!"
                validStatus = true
                continue = 'N'
            else
                puts "INVALID INPUT VALUE"
                validStatus = false
            end
            ################################################################################
            ################################################################################

            if validStatus == false
                puts "Please type 1, 2, 3, 4, 5 or 6 and then press 'Enter'."
            elsif continue != 'N'
                puts "Do you want to continue? (y/N)"
                continue = gets.strip
                if continue != 'y' && continue != 'N'
                    while continue != 'y' && continue != 'N'
                        begin
                            raise InputError
                        rescue InputError => error
                            puts error.message
                        end
                        puts "Please input 'y' or 'N'"
                        continue = gets.strip
                    end
                end
            end
            ################################################################################
            ################################################################################
        end

    end

    class InputError < StandardError
        def message
            "Wrong input. Please read the instruction carefully and try again."
        end
    end

end
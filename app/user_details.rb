module UserDetails

    def self.get_details(current_user)

        puts "First Name: #{current_user.first_name}"
        puts "Last Name: #{current_user.last_name}"

        if current_user.age == nil || current_user.suburb == nil || current_user.country == nil
            puts "Not enough information been given yet.\nPlease tell me more about yourself in Option 1."
        else
            puts "Age: #{current_user.age}"
            puts "Address of City/Suburb: #{current_user.suburb.name}"
            puts "Country: #{current_user.country.name}"
        end


    end

end
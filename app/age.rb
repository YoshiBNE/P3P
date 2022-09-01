module Age

    def self.user_age(birthday)

        validation = true
        Age.format_validator(birthday)
        if validation == false
            puts "Wrong Input!! Please input your date of birth properly in the specified format."
        else
            result = Age.age_checker(birthday)
            if result.length == 2
                puts result[1]
            end
            puts "You are #{result[0]} years old now."
        end
        result[0]
    end

    def self.age_checker(birthday)
        # birthday => "DD/MM/YYYY"
        birthday_array = birthday.split("/")
        day = birthday_array[0].to_i
        month = birthday_array[1].to_i
        year = birthday_array[2].to_i
        
        user_age = [Time.now.year - year]

        if month < Time.now.year
            user_age[0] -= 1
        elsif month == Time.now.month
            if day < Time.now.day
                user_age[0] -= 1
            elsif day == Time.now.day
                user_age << "Happy Birthday!!"
            end
        end
        user_age
    end

    def self.format_validator(birthday)
        birthday_array = birthday.split("/")
        if birthday_array.length != 3
            validator = false
        else
            birthday_array.each.with_index do |num, index|
                if (num.to_i) == 0
                    validator = false
                else
                    num = num.to_i
                    case index
                    when 0
                        if num < 1 || num > 31
                            validator = false
                        end
                    when 1
                        if num < 1 || num > 12
                            validator = false
                        end
                    when 2
                        if num > Time.now.year
                            validator = false
                        end
                    end
                end
            end
        end

        if Time.new(birthday) > Time.now
            validator = false
        end
        validator
    end

end

# birthday = "16/12/1987"

# age = Age.user_age(birthday)

# puts age

class User < ActiveRecord::Base


    def self.create_new(user_name)
        user = User.create(user_name)
    end

    def self.find_by_username(first_name: first_name, last_name: last_name)
        user = find_by(first_name: first_name, last_name: last_name)
    end
end
class Country < ActiveRecord::Base
    has_many :suburbs
    has_many :users, through: :suburbs

    def self.create_or_find(country)
        user = Country.find_or_create_by(name: country)
    end

    def self.user_count
        self.users.count
    end

    def self.suburb_count
        self.suburb.count
    end

    def self.show_all
        countries = Country.all
        countries.each do |country|
            puts "Country Name: #{country.name}\n"
            c_suburbs = country.suburbs
            c_suburbs.each do |suburb|
                puts "   -- #{suburb.name}"
            end
        end
    end

    def self.save
        self.save
    end


end
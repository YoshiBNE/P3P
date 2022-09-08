class Suburb < ActiveRecord::Base
    belongs_to :country
    has_many :users

    def self.create_or_find(suburb)
        suburb = Suburb.find_or_create_by(name: suburb)
    end

    def self.user_count
        self.users.count
    end

    def self.show_all
        suburbs = Suburb.all
        suburbs.each do |suburb|
            puts suburb.name
        end
    end

    def self.save
        self.save
    end


end
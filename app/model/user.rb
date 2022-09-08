class User < ActiveRecord::Base
    belongs_to :suburb
    belongs_to :country

    def self.create_new(user_name)
        user = User.create(user_name)
    end

    def self.find_by_username(f_name, l_name)
        user = find_by(first_name: f_name, last_name: l_name)
    end

    def self.show_all
        users = User.all
        users.each do |u|
            puts "#{u.first_name} #{u.last_name}"
        end
    end

    # def self.find_by_first_name(firstName)
       
    #     sql = <<-SQL
    #       SELECT * FROM users
    #       WHERE first_name = ?
    #     SQL
    
    #     DB[:conn].execute(sql).map do |row|
    #       self.new_from_db(row)
    #     end
    # end

    def self.save
        self.save
    end
end
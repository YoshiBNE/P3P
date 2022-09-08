class AddSuburbToUsers < ActiveRecord::Migration[5.2]

    def change
        add_column :users, :suburb_id, :integer
    end
end
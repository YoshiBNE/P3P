class AddCountryToSuburbs < ActiveRecord::Migration[5.2]

    def change
        add_column :suburbs, :country_id, :integer
    end
end 
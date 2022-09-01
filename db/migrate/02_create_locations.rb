class CreateLocations < ActiveRecord::Migration[5.2]

    def change
        create_table :locations do |t|
            t.string :suburb_name
            t.string :current_weather
            t.string :tmr_weather
            t.integer :post_code
            t.string :best_hotel
        end
    end

end
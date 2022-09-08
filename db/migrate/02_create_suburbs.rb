class CreateSuburbs < ActiveRecord::Migration[5.2]

    def change
        create_table :suburbs do |t|
            t.string :name
            t.integer :post_code
        end
    end

end
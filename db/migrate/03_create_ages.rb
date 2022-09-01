class CreateAges < ActiveRecord::Migration[5.2]

    def change
        create_table :ages do |t|
            t.integer :age
            t.string :validation
            t.string :hooray
        end
    end
end
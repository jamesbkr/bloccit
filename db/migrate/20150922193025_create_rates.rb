class CreateRates < ActiveRecord::Migration
def change
    
    create_table :rates do |t|
        t.integer :severity
        t.references :rateable, polymorphic: true, index: true
        
        t.timestamps null: false
        
    end
end
end
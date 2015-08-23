class CreateDispositivos < ActiveRecord::Migration
  def self.up
    create_table :dispositivos do |t|
      t.string :name
      t.text :local
      t.integer :lat
      t.integer :long

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :dispositivos 
  end
end

class CreateChairs < ActiveRecord::Migration
  def self.up
    create_table :chairs do |t|
      t.boolean :active

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :chairs 
  end
end

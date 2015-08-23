class CreateSensorData < ActiveRecord::Migration
  def self.up
    create_table :sensor_data do |t|
      t.integer :ruido
      t.integer :dispositivo_id 

      t.timestamps null: false
    end
  end
    def self.down
    drop_table :sensor_data  
  end
end

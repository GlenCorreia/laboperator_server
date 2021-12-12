class CreateDeviceSignals < ActiveRecord::Migration[6.1]
  def change
    create_table :device_signals do |t|
      t.integer :noise
      t.integer :signal
      t.integer :threshold
      
      t.timestamps
    end
  end
end

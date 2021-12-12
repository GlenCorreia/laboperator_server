class CreateDeviceSignals < ActiveRecord::Migration[6.1]
  def change
    create_table :device_signals do |t|

      t.timestamps
    end
  end
end

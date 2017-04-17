class CreateUserDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :user_devices do |t|
      t.belongs_to :user, index: true
      t.belongs_to :device, index: true

      t.timestamps
    end
  end
end

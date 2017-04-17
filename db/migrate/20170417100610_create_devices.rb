class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :secret, index: true
      t.string :data

      t.timestamps
    end
  end
end

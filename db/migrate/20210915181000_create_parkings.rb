class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.string :plate, null: false
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end

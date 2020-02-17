class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :movie, foreign_key: true, null: false
      t.string :identification_card, null: false
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end

class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :image_url, null: false
      t.date :start_date, null: false
      t.date :final_date, null: false

      t.timestamps
    end
  end
end

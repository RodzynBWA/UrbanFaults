class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title, null: false, unique: false
      t.string :street, null: false, unique: false
      t.string :house, null: true, unique: false
      t.string :short_place_desc, null: true, unique: false
      t.string :descr, null: false, unique: false
      t.string :state, null: false, unique: false
      t.string :ip, null: false, unique: false
      t.string :report_image, null: true, unique: false
      
      t.references :user, index: true, foreign_key: true, null: false, unique: false
      t.references :city, index: true, foreign_key: true, null: false, unique: false
      t.references :report_category, index: true, foreign_key: true, null: false, unique: false

      t.timestamps null: false
    end
  end
end

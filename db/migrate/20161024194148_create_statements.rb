class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.string :title, null: false, unique: false
      t.string :content, null: false, unique: false
      
      t.references :user, index: true, foreign_key: true, null: false, unique: false
      t.references :report, index: true, foreign_key: true, null: false, unique: false

      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :first_name, null: false, unique: false
      t.string :last_name, null: false, unique: false
      t.string :password_digest, null: false, unique: false
      t.integer :ps_level, null: false, unique: false, default: 0
      t.boolean :is_banned, null: false, unique: false, default: false

      t.references :city, index: true, foreign_key: true, null: false, unique: false
      
      t.timestamps null: false
    end
  end
end

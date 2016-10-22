class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :city, null: false, unique: false
      t.string :first_name, null: false, unique: false
      t.string :last_name, null: false, unique: false
      t.string :password_digest, null: false, unique: false
      t.boolean :is_admin, null: false, unique: false, default: false

      t.timestamps null: false
    end
  end
end

class CreateDepartmentAssignments < ActiveRecord::Migration
  def change
    create_table :department_assignments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

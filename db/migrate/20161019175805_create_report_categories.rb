class CreateReportCategories < ActiveRecord::Migration
  def change
    create_table :report_categories do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end

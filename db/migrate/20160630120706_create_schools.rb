class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :country
      t.string :website

      t.timestamps null: false
    end
  end
end

class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :country
      t.string :website

      t.string :primary_colour, :default => '#FF00FF'
      t.string :secondary_colour, :default => '#00FFFF'
      t.string :text_colour, :default => '#000000'

      t.boolean :active, :default => false

      t.timestamps null: false
    end
  end
end

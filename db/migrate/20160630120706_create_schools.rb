class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :country
      t.string :website

      t.string :primary_colour, :default => 'Orange'
      t.string :secondary_colour, :default => 'Green'
      t.string :text_colour, :default => 'Black'

      t.boolean :active, :default => false

      t.timestamps null: false
    end
  end
end

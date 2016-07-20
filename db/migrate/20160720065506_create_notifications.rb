class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :course, index: true
      t.text :message
      t.string :controller
      t.string :target

      t.timestamps
    end
  end
end

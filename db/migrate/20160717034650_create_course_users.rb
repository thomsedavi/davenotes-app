class CreateCourseUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :course_users do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end

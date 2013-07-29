class CreateTaskComments < ActiveRecord::Migration
  def change
    create_table :task_comments do |t|
      t.string :comment_user
      t.string :message
      t.datetime :message_date
      t.references :task, index: true

      t.timestamps
    end
  end
end

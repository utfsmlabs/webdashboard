class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :number
      t.string :status
      t.integer :percentage
      t.string :assigned_user
      t.string :description

      t.timestamps
    end
  end
end

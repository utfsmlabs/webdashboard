class CreatePcs < ActiveRecord::Migration
  def change
    create_table :pcs do |t|
      t.string :lab
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end

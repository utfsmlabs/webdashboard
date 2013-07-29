class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :turn

      t.timestamps
    end
  end
end

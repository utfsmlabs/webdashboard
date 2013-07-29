class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.integer :number
      t.string :message

      t.timestamps
    end
  end
end

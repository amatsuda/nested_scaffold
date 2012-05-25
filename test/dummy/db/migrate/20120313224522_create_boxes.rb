class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end

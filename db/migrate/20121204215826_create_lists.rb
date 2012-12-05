class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name_list
      t.boolean :est_list

      t.timestamps
    end
  end
end

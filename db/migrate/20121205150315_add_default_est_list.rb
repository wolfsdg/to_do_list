class AddDefaultEstList < ActiveRecord::Migration
  def change
    drop_table :lists
    create_table :lists do |t|
      t.string :name_list
      t.boolean :est_list, default: false

      t.timestamps
    end
  end
end

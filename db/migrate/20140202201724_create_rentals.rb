class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :item_id
      t.datetime :due_on
      t.datetime :returned_on

      t.timestamps
    end
  end
end

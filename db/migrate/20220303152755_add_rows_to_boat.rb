class AddRowsToBoat < ActiveRecord::Migration[6.1]
  def change
    add_column :boats, :description, :string
    add_column :boats, :location, :string
    add_column :boats, :price, :integer
  end
end

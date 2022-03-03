class AddConditionToBoatAvailable < ActiveRecord::Migration[6.1]
  def change
    change_column :boats, :available, :boolean, default: true
  end
end

class AddUsersToBoats < ActiveRecord::Migration[6.1]
  def change
    add_reference :boats, :user, null: false, foreign_key: true
  end
end

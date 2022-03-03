class AddExtraFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fullname, :string
    add_column :users, :owner, :boolean
  end
end

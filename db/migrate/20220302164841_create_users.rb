class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :owner
      t.string :name
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end

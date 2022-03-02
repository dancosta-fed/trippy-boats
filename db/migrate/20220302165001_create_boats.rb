class CreateBoats < ActiveRecord::Migration[6.1]
  def change
    create_table :boats do |t|
      t.boolean :available
      t.string :name

      t.timestamps
    end
  end
end

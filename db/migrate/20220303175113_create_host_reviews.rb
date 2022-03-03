class CreateHostReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :host_reviews do |t|
      t.string :comment
      t.integer :star
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

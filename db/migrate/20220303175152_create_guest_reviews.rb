class CreateGuestReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :guest_reviews do |t|
      t.string :comment
      t.integer :star
      t.references :user, null: false, foreign_key: true
      t.references :boat, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :city
      t.string :profession
      t.text :inspirations
      t.text :likes
      t.text :accomplishments
      t.text :notes

      t.timestamps
    end
  end
end

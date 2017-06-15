class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :skills
      t.text :learning
      t.datetime :localtime
      t.text :bio
      t.text :image
      t.text :location
      t.text :longitude
      t.text :latitude
      t.integer :price
      t.text :password_digest

      t.timestamps
    end
  end
end

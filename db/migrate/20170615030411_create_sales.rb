class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.string :email
      t.string :guid
      t.references :booking, foreign_key: true
      t.string :stripe_id

      t.timestamps
    end
  end
end

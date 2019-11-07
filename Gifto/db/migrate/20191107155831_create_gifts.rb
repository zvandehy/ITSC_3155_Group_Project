class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.references :recipient, foreign_key: { to_table: 'users' }
      t.references :giver, foreign_key: { to_table: 'users' }
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

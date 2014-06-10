class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :town
      t.string :county
      t.string :post_code

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end

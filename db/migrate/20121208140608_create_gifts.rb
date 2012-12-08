class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.references :user
      t.text :description

      t.timestamps
    end
    add_index :gifts, :user_id
  end
end

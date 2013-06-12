class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.string :description
      t.integer :user_id
      t.integer :votes

      t.timestamps
    end
  end
end

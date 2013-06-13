class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :sub_comment_id
      t.integer :parent_comment_id

      t.timestamps
    end
  end
end

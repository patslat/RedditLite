class ChangeUserIdToSubmitterIdInLinks < ActiveRecord::Migration
  def change
    remove_column :links, :user_id
    add_column :links, :submitter_id, :integer
  end
end

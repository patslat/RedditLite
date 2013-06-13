class Reply < ActiveRecord::Base
  attr_accessible :parent_comment_id, :sub_comment_id
  belongs_to :parent_comment, class_name: 'Comment',
    foreign_key: :parent_comment_id,
    primary_key: :id
  belongs_to :sub_comment, class_name: 'Comment',
    foreign_key: :sub_comment_id,
    primary_key: :id
end

class Comment < ActiveRecord::Base
  attr_accessible :body, :link_id, :author_id, :parent_comment

  belongs_to :author, class_name: 'User'
  belongs_to :link

  has_many :sub_replies, class_name: 'Reply', foreign_key: :parent_comment_id
  has_many :sub_comments, through: :sub_replies, source: :sub_comment

  has_one :parent_reply, class_name: 'Reply', foreign_key: :sub_comment_id

  has_one :parent_comment, through: :parent_reply, source: :parent_comment

  def self.build_comment_tree(comments)
    built_tree = []
    comment_tree = comments.reverse
    while child = comment_tree.pop
      built_tree << child
      sub_comments = child.sub_comments
      next if sub_comments.empty?
      comment_tree += sub_comments
    end
    built_tree
  end
end

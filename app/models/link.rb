class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url,
                  :submitter_id

  belongs_to :submitter, class_name: 'User'

  has_many :link_subs
  has_many :subs, through: :link_subs

  has_many :comments
  has_many :sub_comments, through: :comments
end

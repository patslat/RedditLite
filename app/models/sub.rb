class Sub < ActiveRecord::Base
  attr_accessible :moderator_id, :name, :links_attributes
  has_many :link_subs
  has_many :links, through: :link_subs
  belongs_to :moderator, class_name: 'User'
  accepts_nested_attributes_for :links, :reject_if => :all_blank
end

class News < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
 # has_many :comments
  before_create :collapse

  default_scope -> { order('created_at DESC') }

  validates :name, presence: true, length: {maximum: 50}
  validates :content, presence: true
end

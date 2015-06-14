class Visit < ActiveRecord::Base

  validates :page, presence: true
  validates :ip, presence: true
end

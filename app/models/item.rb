class Item < ActiveRecord::Base
  # relations
  belongs_to :group
  has_many :rentals

  # validations
  validates :group_id, presence: true
  validates :name, presence: true


end

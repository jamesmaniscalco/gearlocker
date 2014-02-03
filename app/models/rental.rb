class Rental < ActiveRecord::Base

  # relations
  belongs_to :item

  # validations
  validates :item_id, presence: true
  validates :due_on, presence: true


end

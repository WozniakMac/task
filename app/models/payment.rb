class Payment < ActiveRecord::Base
  belongs_to :student

  validates :student, :payment_date, presence: true
end

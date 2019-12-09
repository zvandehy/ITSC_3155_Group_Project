class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :giver, required: false
  validates :name, presence: true, allow_blank: false
end

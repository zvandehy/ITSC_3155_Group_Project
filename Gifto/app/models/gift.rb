class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :giver
end

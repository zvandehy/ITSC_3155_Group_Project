class Gift < ApplicationRecord
  belongs_to :recipient
  belongs_to :giver
end

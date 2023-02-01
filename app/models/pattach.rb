class Pattach < ApplicationRecord
  belongs_to :project
  has_one_attached :att
end

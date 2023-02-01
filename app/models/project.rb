class Project < ApplicationRecord
  belongs_to :user
  has_many :pattaches, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :msgs, dependent: :destroy

end

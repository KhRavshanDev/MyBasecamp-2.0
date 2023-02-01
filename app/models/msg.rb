class Msg < ApplicationRecord
  belongs_to :project
  has_many :sms, dependent: :destroy
end

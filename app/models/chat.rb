class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :target, class_name: 'User'
  has_many :messages, dependent: :destroy
end

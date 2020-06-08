class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
end

class Category < ApplicationRecord
  belongs_to :user
  has_many :group_categories
  has_many :groups, through: :group_categories

  validates :name, presence: true
  validates :amount, presence: true
end

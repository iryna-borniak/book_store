class Book < ApplicationRecord
  validates :title, :author, :description, presence: true
  validates :isbn, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 13 }

  scope :ordered_by_title, -> { order(:title) }
end

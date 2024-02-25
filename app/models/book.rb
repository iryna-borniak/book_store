class Book < ApplicationRecord
  update_index("books") { self }

  has_one_attached :cover_image
  has_one_attached :pdf_file

  validates :title, :author, :description, presence: true
  validates :isbn, presence: true, uniqueness: { case_sensitive: false }, numericality: { only_integer: true }, length: { is: 13 }

  scope :ordered_by_title, -> { order(:title) }
end

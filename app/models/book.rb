class Book < ApplicationRecord
  has_one_attached :cover_image
  has_one_attached :pdf_file

  validates :title, :author, :description, presence: true
  validates :isbn, presence: true, uniqueness: { case_sensitive: false }, numericality: { only_integer: true }, length: { is: 13 }
  validates :cover_image, dimension: { width: { min: 16, max: 180 },
                                       height: { min: 16, max: 180 } },
                          aspect_ratio: :square

  scope :ordered_by_title, -> { order(:title) }
end

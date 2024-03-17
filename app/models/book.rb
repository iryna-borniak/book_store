class Book < ApplicationRecord
  has_one_attached :cover_image
  has_one_attached :pdf_file

  validates :title, :author, :description, presence: true
  validates :isbn, presence: true, uniqueness: { case_sensitive: false }, numericality: { only_integer: true }, length: { is: 13 }
  validates :cover_image, dimension: { width: { min: 490, max: 1220 },
                                       height: { min: 600, max: 1510 } }

  scope :ordered_by_title, -> { order(:title) }

  def restore_defaults!
    update(title: "Title placeholder")

    cover_image.attach(
      io: File.open("app/assets/images/no-image-placeholder.png"),
      filename: "no-image-placeholder.png",
      content_type: "image/png"
    )
  end
end

class SiteSetting < ApplicationRecord
  acts_as_singleton

  has_one_attached :favicon, dependent: :destroy

  after_initialize :set_default_favicon

  singleton_class.alias_method :current, :instance

  def self.restore_defaults!
    default_attributes = {
      title: "E-Library",
      favicon: {
        io: File.open("app/assets/images/favicon.png"),
        filename: "favicon.png",
        content_type: "image/png"
      }
    }

    SiteSetting.current.update(default_attributes)
  end

  private

  def set_default_favicon
    return unless new_record? && !favicon.attached?

    favicon.attach(
      io: File.open("app/assets/images/favicon.png"),
      filename: "favicon.png",
      content_type: "image/png"
    )
  end
end

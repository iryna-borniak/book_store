require "rails_helper"

RSpec.describe Book, type: :model do
  let!(:book) { create(:book) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:isbn) }
  it { is_expected.to validate_uniqueness_of(:isbn).case_insensitive }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_numericality_of(:isbn).only_integer }
  it { is_expected.to validate_length_of(:isbn).is_equal_to(13) }
  
  it { is_expected.to have_one_attached(:cover_image) }
  it { is_expected.to have_one_attached(:pdf_file) }

  it "has an attached cover" do
    expect(book.cover_image).to be_attached
  end

  it "has an attached pdf file" do
    expect(book.pdf_file).to be_attached
  end
end

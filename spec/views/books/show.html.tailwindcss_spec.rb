require "rails_helper"

RSpec.describe "books/show", type: :view do
  before(:each) do
    assign(:book, Book.create!(
                    title: "Title",
                    author: "Author",
                    isbn: "1234567890123",
                    description: "MyText"
                  ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/1234567890123/)
    expect(rendered).to match(/MyText/)
  end
end

require "rails_helper"

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
             Book.create!(
               title: "Title",
               author: "Author",
               isbn: "1234567890123",
               description: "MyText"
             ),
             Book.create!(
               title: "Title",
               author: "Author",
               isbn: "1234567890122",
               description: "MyText"
             )
           ])
  end

  it "renders a list of books" do
    render
    
    assert_select "h3", text: Regexp.new("Title".to_s), count: 2    
  end
end

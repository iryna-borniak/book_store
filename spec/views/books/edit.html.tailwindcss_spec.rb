require 'rails_helper'

RSpec.describe 'books/edit', type: :view do
  let(:book) do
    Book.create!(
      title: 'MyString',
      author: 'MyString',
      isbn: '1234567890123',
      description: 'MyText'
    )
  end

  before(:each) do
    assign(:book, book)
  end

  it 'renders the edit book form' do
    render

    assert_select 'form[action=?][method=?]', book_path(book), 'post' do
      assert_select 'input[name=?]', 'book[title]'

      assert_select 'input[name=?]', 'book[author]'

      assert_select 'input[name=?]', 'book[isbn]'

      assert_select 'textarea[name=?]', 'book[description]'
    end
  end
end

require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  before(:each) do
    assign(:book, Book.new(
                    title: 'MyString',
                    author: 'MyString',
                    isbn: '1234567890123',
                    description: 'MyText'
                  ))
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
      assert_select 'input[name=?]', 'book[title]'

      assert_select 'input[name=?]', 'book[author]'

      assert_select 'input[name=?]', 'book[isbn]'

      assert_select 'textarea[name=?]', 'book[description]'
    end
  end
end

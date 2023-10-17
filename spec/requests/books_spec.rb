require "rails_helper"

RSpec.describe BooksController, type: :request do  
  let(:valid_attributes) { FactoryBot.attributes_for(:book) }

  let(:invalid_attributes) { { title: "" } }

  let(:new_attributes) { FactoryBot.attributes_for(:book) }

  describe "GET #index" do
    it "renders a successful response" do
      Book.create! valid_attributes
      get books_url

      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "renders a successful response" do
      book = Book.create! valid_attributes
      get book_url(book)

      expect(response).to be_successful
    end    
  end

  describe "GET #new" do
    it "renders a successful response" do
      get new_book_url

      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "renders a successful response" do
      book = Book.create! valid_attributes
      get edit_book_url(book)

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Book and redirects to the created book" do

        expect do
          post books_url, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)

        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book and renders a response with 422 status ('new' template)" do

        expect do
          post books_url, params: { book: invalid_attributes }
        end.to change(Book, :count).by(0)

        expect(response).to be_unprocessable
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the requested book and redirects" do
        book = Book.create! valid_attributes

        expect do
          patch book_url(book), params: { book: new_attributes }
          book.reload
        end.to change(book, :title).to(new_attributes[:title])
               
        expect(response).to redirect_to(book_url(book))                
      end      
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: invalid_attributes }

        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book and redirects" do
      book = Book.create! valid_attributes

      expect do
        delete book_url(book)
      end.to change(Book, :count).by(-1)

      expect(response).to redirect_to(books_url)
    end    
  end
end

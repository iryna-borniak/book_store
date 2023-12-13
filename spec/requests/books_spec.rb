require "rails_helper"

RSpec.describe BooksController, type: :request do
  let(:empty_query) { "" }
  let(:nonexistent_query) { "nonexistent_query" }
  let(:valid_attributes) { attributes_for(:book) }
  let(:invalid_attributes) { attributes_for(:book, :empty_title) }
  let(:new_attributes) { attributes_for(:book, :new_title) }
  let!(:book) { create(:book) }

  before { BooksIndex.reset }

  describe "GET #index" do
    it "renders a successful response" do
      get books_path

      expect(response).to be_successful
      expect(response.body).to include(CGI.escapeHTML(book.title))
    end
  end

  describe "GET #search" do
    context "without a query" do
      it "renders the turbo_stream update with book title" do
        get search_path, params: { search: { query: empty_query } }

        expect(response).to be_successful
        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response.body).to include(CGI.escapeHTML(book.title))
      end
    end

    context "with existent query" do
      it "renders the turbo_stream update with book title" do
        get search_path, params: { search: { query: CGI.escapeHTML(book.title) } }
        
        expect(response).to be_successful
        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response.body).to include(CGI.escapeHTML(book.title))
      end
    end

    context "with nonexistent query" do
      it "renders the turbo_stream update with no books found" do
        get search_path, params: { search: { query: nonexistent_query } }

        expect(response).to be_successful
        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response.body).to include("No books found")
      end
    end
  end

  describe "GET #show" do
    it "renders a successful response" do      
      get book_path(book)

      expect(response).to be_successful
      expect(response.body).to include(CGI.escapeHTML(book.title))
    end    
  end

  describe "GET #new" do
    it "renders a successful response" do
      get new_book_path

      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "renders a successful response" do      
      get edit_book_path(book)

      expect(response).to be_successful
      expect(response.body).to include(CGI.escapeHTML(book.title))
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Book and redirects to the created book" do
        expect do
          post books_path, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)

        expect(response).to be_redirect
        expect(flash[:notice]).to eq("Book was successfully created.")
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book and renders a response with 422 status ('new' template)" do
        expect do
          post books_path, params: { book: invalid_attributes }
        end.not_to change(Book, :count)

        expect(response).to be_unprocessable
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the requested book and redirects" do
        expect do
          patch book_path(book), params: { book: new_attributes }

          book.reload
        end.to change(book, :title).to(new_attributes[:title])

        expect(response).to redirect_to(book_path(book))
        expect(flash[:notice]).to eq("Book was successfully updated.")
      end      
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do        
        patch book_path(book), params: { book: invalid_attributes }

        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book and redirects" do
      expect do
        delete book_path(book)
      end.to change(Book, :count).by(-1)

      expect(response).to redirect_to(books_path)
      expect(flash[:alert]).to eq("Book was successfully destroyed.")
    end    
  end
end

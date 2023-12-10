class BooksController < ApplicationController
  def index
    @books = collection
  end

  def search
    @search = Search.new(search_params)
    @books = @search.search

    render turbo_stream:
      if @books.any?
        turbo_stream.update("books", partial: "books/book", collection: @books, as: :book)
      else
        turbo_stream.update("books", partial: "books/no_books_found")
    end
  end

  def show
    @book = resource
  end
  
  def new
    @book = Book.new
  end
  
  def edit
    @book = resource
  end
  
  def create
    @book = Book.new(book_params)
    
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."      
    else
      render :new, status: :unprocessable_entity      
    end    
  end
  
  def update
    @book = resource
    
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."             
    else
      render :edit, status: :unprocessable_entity     
    end   
  end
  
  def destroy
    resource.destroy    
    
    redirect_to books_path, alert: "Book was successfully destroyed.", status: :see_other       
  end

  private
  
  def collection
    Book.ordered_by_title
  end

  def resource
    collection.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:title, :author, :isbn, :description, :cover_image, :pdf_file)
  end

  def search_params
    params.require(:search).permit(:query)
  end
end

class BooksController < ApplicationController
  def index
    @books = collection
  end
  
  def show
    @book = resource
  end
  
  def view_pdf
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
end

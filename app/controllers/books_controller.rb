class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    
    if @book.save
      flash[:success] = '本を登録しました'
      redirect_to @root_path
    else
      flash.now[:danger] = '本を登録できませんでした'
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:success] = '編集しました'
      redirect_to @book
    else
      flash.now[:danger] = '編集できませんでした'
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    
    flash[:success] = '削除しました'
    redirect_to books_url
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title)
  end
  
end

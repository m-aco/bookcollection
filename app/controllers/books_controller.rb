class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    
    if @book.save
      flash[:success] = '登録しました'
      redirect_to @book
    else
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    
    if @book.update(book_params)
      flash[:success] = '編集しました'
      redirect_to @book
    else
      flash.now[:danger] = '編集できませんでした'
      render :edit
    end
  end

  def destroy
    @book.destroy
    
    flash[:success] = '削除しました'
    redirect_to books_url
  end
  
  private
  
  def set_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:title, :review)
  end
  
end

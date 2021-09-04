class BooksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @books = current_user.books.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = '登録しました'
      redirect_to root_url
    else
      @books = current_user.books.order(id: :desc)
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
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
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :review)
  end
  
  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to root_url
    end
  end
end

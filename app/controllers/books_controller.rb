class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @book = Book.new
    # @user = current_user
    @book = Book.find(params[:id])
    @user = @book.user
    # @bookから、belongs_to: userで紐づけてあるので、userでそのブックを投稿したuserという意味になる。
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
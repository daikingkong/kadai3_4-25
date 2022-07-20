class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def create
    @book = book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

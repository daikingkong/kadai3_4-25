class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
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

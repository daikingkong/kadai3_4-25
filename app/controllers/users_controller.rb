class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def create
    @book = book.new(user_params)
    if @book.user_id = current_user.id
      @book.save
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render "index"
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

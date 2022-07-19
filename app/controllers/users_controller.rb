class UsersController < ApplicationController
  def show
    @user = Book.find(params[:id])
  end

  def index
  end

  def edit
  end
end

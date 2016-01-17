class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to our community, #{@user.username}!"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def edit
   
  end
  
  
  def update
    
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully!"
      redirect_to articles_path
    else
      render 'edit'
    end
      
  end
  
  def show
    
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 6)
  end
  
  def destroy
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
   
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

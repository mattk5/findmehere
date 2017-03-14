class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:edit, :update]
  before_action :correct_user,    only: [:edit, :update]

  def new
  	@user = User.new
    @contact = Contact.new
  end

  def create
  	@user = User.new(user_params)
    @contact = Contact.new(params[:phone_number])
  	if @user.save && @contact.save
  		log_in @user 
  		remember @user 
  		flash[:success] = "Welcome! Account created."
  		redirect_to @user 
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
    @contact = Contact.find(params[:user_id])
  end

  def update 
    @user = User.find(params[:id])
    @contact = Contact.find(params[:user_id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user 
    else
      render 'edit'
    end
  end 

  def show
  	@user = User.find(params[:id])
    @contact = Contact.find(params[:user_id])
  end

  private 

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Sign in to update profile."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end

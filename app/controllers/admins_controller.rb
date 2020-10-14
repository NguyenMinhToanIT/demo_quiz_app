class AdminsController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :update, :show, :index]
  before_action :correct_user, only:[:edit, :update, :show]
  before_action :admin_user, only: :destroy
  def index
    @admins = User.paginate(page: params[:page],per_page:5)
  end
  def new
    @admin = User.new
  end
  def show
    @admin = User.find(params[:id])
  end
  def create
    @admin = User.new(user_params)
    if @admin.save 
      UserMailer.account_activation(@admin).deliver_now
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    @admin = User.find(params[:id])
  end
  def update
    @admin = User.find(params[:id])
    if @admin.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @admin
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end
end

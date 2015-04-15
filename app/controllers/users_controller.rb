class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :new, :create, :destroy]
  before_action :correct_user, only: [:edit, :update]

  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(sort_column + " " + sort_direction)
  end

  def new
  	@user = User.new
  end
  
  def create
  @user = User.new(user_params)
    if @user.save
    	flash[:success] = "User Created"
      	redirect_to root_url
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to root_url flash[:success] = "User Destroyed" }
      format.json { head :no_content }
    end
  end


  private
    def correct_user
      @user = User.find(params[:id])
      unless current_user == @user || current_user.admin
        redirect_to root_url, notice: "You can't do that."
      end
    end
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      if signed_in? && admin?
        params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :school_id, :admin, :setting_hide_others)
      else
        params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
      end
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(resource_params)

    if @user.save
      redirect_to root_url, notice: "User has been created successfully."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(resource_params)
      redirect_to root_url, notice: "User has been updated successfully."
    else
      render :edit
    end
  end

  private 

  def resource_params
    params.require(:user).permit(
                          :first_name,
                          :last_name,
                          :gender,
                          :avatar,
                          :dob,
                          :is_student,
                          :private,
                          :is_tutor,
                          types: [],
                          hobbies: []
                        )
  end
end

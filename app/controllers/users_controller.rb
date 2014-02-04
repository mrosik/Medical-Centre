class UsersController < ApplicationController
  before_filter :is_admin?, :only => [:index, :destroy]
  skip_filter :authorize, :only => [:new, :create]
   def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def index_doctor
    role = Role.find_by_name("Doctor");
    @doctor = role.users
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def index_patient
    role = Role.find_by_name("Patient");
    @patient = role.users
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def index_admin
    role = Role.find_by_name("Admin");
    @admin = role.users
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end


  def show
    if current_user
      @user = User.find(current_user.id)
    else
      @user = User.find(params[:id])
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

   def new
    @user = User.new
    @specialisations = Specialisation.all
    @appointments = Appointment.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

    def edit
    @user = User.find(params[:id])
    @specialisations = Specialisation.all
    #@appointments = Appointment.all
  end

   def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @user = User.find(params[:id])
    @specialisations = Specialisation.all


    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


end



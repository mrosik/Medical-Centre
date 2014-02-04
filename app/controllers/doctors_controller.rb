class DoctorsController < ApplicationController
  before_filter :authorize, :except => [:index]
  skip_filter :is_admin?, :only => [:index]

  #def specialisation
   # @doctors = Doctor.find_all_by_specialisation(params[:id])
    #@specialisation = params[:id]
       #respond_to do |format|
     # format.html # index.html.erb
      #format.json {render json:@doctors}
   # end
  #end



    def index
      @doctors = Doctor.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @doctors }
      end
    end

    def show
      if current_user
        if !current_user.admin
        @doctor = Doctor.find(current_user.id)
       # @appointments = current_user.appointments.all
        else
          @doctor = Doctor.find(params[:id])
        end
        @specialisations = Specialisation.all



      else
        @doctor = Doctor.find(params[:id])
        #@appointments = @doctor.appointments.all
      end
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @doctor }
      end
    end

    def new
      @doctor = Doctor.new
      @specialisations = Specialisation.all

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @doctor }
      end
    end

    def edit
      @doctor = Doctor.find(params[:id])
      @specialisations = Specialisation.all
     # @appointments = Appointment.all
    end

    def create
      @doctor = Doctor.new(params[:doctor])

      respond_to do |format|
        if @doctor.save
          format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
          format.json { render json: @doctor, status: :created, location: @doctor }
        else
          format.html { render action: "new" }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @doctor = Doctor.find(params[:id])

      respond_to do |format|
        if @doctor.update_attributes(params[:doctor])
          format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @doctor = Doctor.find(params[:id])
      @doctor.destroy

      respond_to do |format|
        format.html { redirect_to doctors_url }
        format.json { head :no_content }
      end
    end

end

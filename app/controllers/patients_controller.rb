class PatientsController < ApplicationController
  before_filter :is_admin?, :only => [:index, :destroy]
  skip_filter :authorize, :only => [:new, :create]
    def index
      @patients = Patient.all
     # @appointments = Appointment.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @patients }
        end
    end

  def show
    if current_user
      if !current_user.admin
        @patient = Patient.find(current_user.id)
      else
        @patient = Patient.find(params[:id])
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  def new
      @patient = Patient.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @patient }
      end
    end

    def edit
      @patient = Patient.find(params[:id])
     #@appointments = Appointment.all
    end

    def create
      @patient = Patient.new(params[:patient])

      respond_to do |format|
        if @patient.save
          format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
          format.json { render json: @patient, status: :created, location: @patient }
        else
          format.html { render action: "new" }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      patients = Patient.find(params[:id])
      @patient = Patient.find(params[:id])

      respond_to do |format|
        if @patient.update_attributes(params[:patient])
          format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end


    def destroy
      @patient = Patient.find(params[:id])
      @patient.destroy

      respond_to do |format|
        format.html { redirect_to patients_url }
        format.json { head :no_content }
      end
    end

end

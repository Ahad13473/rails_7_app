class PersonalDataController < ApplicationController
    def index
      @personal_data = PersonalDatum.all
    end
    def show
      @personal_data = PersonalData.find(params[:id])
    end

    def new
      @personal_data = PersonalData.new
      @personal_data.build_employment
    end

    def create
      @personal_data = PersonalData.new(personal_data_params)
      if @personal_data.save
        redirect_to personal_data_path(@personal_data)
      else
        render :new
      end
    end

    private

    def personal_data_params
      params.require(:personal_data).permit(:first_name, :last_name, :nickname, :email, :phone_number, employment_attributes: [:employer, :date_started, :date_ended])
    end
  end


class EmploymentsController < ApplicationController
  def new
    @personal_data = PersonalData.find(params[:personal_data_id])
    @employment = @personal_data.build_employment
    render turbo_stream: turbo_stream.replace('new-employment-form', partial: 'employments/form', locals: { personal_data: @personal_data, employment: @employment })
  end

  def create
    @personal_data = PersonalData.find(params[:personal_data_id])
    @employment = @personal_data.build_employment(employment_params)
    if @employment.save
      redirect_to personal_data_path(@personal_data)
    else
      render turbo_stream: turbo_stream.replace('new-employment-form', partial: 'employments/form', locals: { personal_data: @personal_data, employment: @employment })
    end
  end

  private

  def employment_params
    params.require(:employment).permit(:employer, :date_started, :date_ended)
  end
end

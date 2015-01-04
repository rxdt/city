class UserStepsController < ApplicationController
  include Wicked::Wizard
  
  steps :ad_image, :select_dates, :submit_payment

  def show
    @ad = Ad.create!
    case step
    when :select_dates
      @start = params[:start] unless params[:start].nil?
      @end = params[:end] unless params[:end].nil?
    end
    render_wizard
  end

  def update
    @ad = Ad.last
    if @ad.update_attribute(:start, params[:start])
      flash[:success] = 'Start date selected'
    else
      flash[:error] = 'Failed to select date'
    end
    render_wizard @ad
  end

  private

  def update_image_params
    params.require(:ad).permit(:ad_image)
  end

end

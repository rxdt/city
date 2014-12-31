class UserStepsController < ApplicationController
  include Wicked::Wizard
  
  steps :ad_image, :select_dates, :submit_payment

  def show
    @ad = Ad.create!
    render_wizard
  end

  def update
    # if @ad.update_attribute(params[:ad_image])
    #   flash[:success] = 'Image uploaded.'
    # else
    #   flash[:error] = 'Failed to upload image.'
    # end
    render_wizard @ad
  end

  private

  def set_user
    @user = current_user
  end

  def update_image_params
    params.require(:ad).permit(:ad_image)
  end

end

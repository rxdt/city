class LandingsController < ApplicationController
  skip_before_action :authenticate_user!

  def welcome
    render layout: false
  end

  def thank_you
    render layout: false
  end

  def faq
    render layout: false
  end
end

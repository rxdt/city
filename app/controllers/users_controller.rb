class UsersController < ApplicationController
  before_filter :authenticate_user!

  def my_ads
  end
end

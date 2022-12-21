class SplashScreenController < ApplicationController
  def index
    if current_user.present?
      @categories = current_user.groups.all
    end
  end
end

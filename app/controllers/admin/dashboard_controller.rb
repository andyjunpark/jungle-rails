class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book", except: :index
  def show
    # render plain: "Welcome back Junglebook!"
  end
end

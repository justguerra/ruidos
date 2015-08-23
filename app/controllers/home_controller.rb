class HomeController < ApplicationController
  before_action :set_chair, only: [:show, :edit, :update, :destroy]
  
     layout "application"
  # GET /chairs
  def index

  end
 
end

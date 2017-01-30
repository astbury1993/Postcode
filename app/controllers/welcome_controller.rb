class WelcomeController < ApplicationController
  def index
      @imports = Import.all
      
  end
end

class ImportsController < ApplicationController
    def index
        @imports = Import.all
    end
    
    require 'csv'
    def import
        Import.import(params[:file])
    end
    
    def show
        
    end
    
end

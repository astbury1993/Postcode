class ImportsController < ApplicationController
    def index
        @imports = Import.all
    end
    
    require 'csv'
    def import
        Import.delete_all
        Failed.delete_all
        Import.import(params[:file])
    end
    
    def show
        
    end
    
end

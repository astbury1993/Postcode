class ImportsController < ApplicationController
    
    def index
        @imports = Import.all
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"succeeded_validation\""
                headers['Content-type'] ||= 'text/csv'
            end
        end
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

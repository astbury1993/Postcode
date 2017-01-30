class FailedsController < ApplicationController
    
    require 'csv'
    
    def index
        @faileds = Failed.all
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"failed_validation\""
                headers['Content-type'] ||= 'text/csv'
            end
        end
    end
end

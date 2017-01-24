class TestScript < ApplicationController
  def run
      # in here I am going to run checks against the applications validation method found in import.rb
      # in order to do that, I am going to attempt to import some data, some of which should pass the test and others that should not.
      require 'csv'
      CSV.foreach(filename, :headers => true) do |row|
          Import.create!(row.to_hash)
      
  end
end

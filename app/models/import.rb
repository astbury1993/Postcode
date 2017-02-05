class Import < ActiveRecord::Base
   
    require 'csv'
    
    
def self.import(file)
    #2 arrays. One for failures and one for passes
    failures = Array.new
    passes = Array.new
    
    # Read the csv uploaded
    arr_of_arrs = CSV.read(file.path)
    
    # For every row do the regexp
    arr_of_arrs.each{ |row|
    
    
    #Check the second element as that contains the postcode
    value = row[1]
    
    #Output to console - remove in production
    # puts value
    
    #Add to the pass or fail array
    if value =~ /(GIR\s0AA)|((([A-PR-UWYZ][0-9][0-9]?)|(([A-PR-UWYZ][A-HK-Y][0-9](?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)[0-9])[0-9])|([A-PR-UWYZ][A-HK-Y](?!AB|LL|SO)[0-9]) |(WC[0-9][A-Z]) |(([A-PR-UWYZ][0-9][A-HJKPSTUW]) |([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s[0-9][ABD-HJLNP-UW-Z]{2})/
    passes << row
    else
    failures << row
end

}

#Now output the files
CSV.open("#{Rails.root}/public/pass.csv", "wb") do |csv|
    passes.each{|row| csv << row}
end

CSV.open("#{Rails.root}/public/fails.csv", "wb") do |csv|
    failures.each{|row| csv << row}
end



end

#def self.import(file)
    # csv = CSV.parse(file.path, :headers => true, :encoding => 'ISO-8859-1')
#   CSV.foreach(file.path, headers: true) do |row|
    
    
#   t = Import.new
#   t.row_id = row['row_id']
#   t.text = row['postcode']
#   t.save
#   if t.save
#   else
#   u = Failed.new
#   u.row_id = row['row_id']
#   u.text = row['postcode']
#   u.save
#end
#end
#end


# Postcode Validation including definition of allowed format
#POST_REGEX = /(GIR\s0AA)|((([A-PR-UWYZ][0-9][0-9]?)|(([A-PR-UWYZ][A-HK-Y][0-9](?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)[0-9])[0-9])|([A-PR-UWYZ][A-HK-Y](?!AB|LL|SO)[0-9]) |(WC[0-9][A-Z]) |(([A-PR-UWYZ][0-9][A-HJKPSTUW]) |([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s[0-9][ABD-HJLNP-UW-Z]{2})/

# A9 or A99 prefix
# AA99 prefix with some excluded areas
# AA9 prefix with some excluded areas
# WC1A prefix
# A9A prefix
# AA9A prefix
# 9AA suffix

# ensures the text being imported is not blank
#validates :text, presence: true, format: { with: POST_REGEX }


end

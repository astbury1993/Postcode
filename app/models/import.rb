class Import < ActiveRecord::Base
   
    require 'csv'
    
    def self.import(file)
    import.
    # csv = CSV.parse(file.path, :headers => true, :encoding => 'ISO-8859-1')
    CSV.foreach(file.path, headers: true) do |row|
    t = Import.new
    t.row_id = row['row_id']
    t.text = row['text']
    t.save
    if t.save
    else
    u = Failed.new
    u.row_id = row['row_id']
    u.text = row['text']
    u.save
end
end
end


# Postcode Validation including definition of allowed format
POST_REGEX = /(GIR\s0AA)|((([A-PR-UWYZ][0-9][0-9]?)|(([A-PR-UWYZ][A-HK-Y][0-9](?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)[0-9])[0-9])|([A-PR-UWYZ][A-HK-Y](?!AB|LL|SO)[0-9]) |(WC[0-9][A-Z]) |(([A-PR-UWYZ][0-9][A-HJKPSTUW]) |([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s[0-9][ABD-HJLNP-UW-Z]{2})/

# A9 or A99 prefix
# AA99 prefix with some excluded areas
# AA9 prefix with some excluded areas
# WC1A prefix
# A9A prefix
# AA9A prefix
# 9AA suffix

# ensures the text being imported is not blank
validates :text, presence: true, format: { with: POST_REGEX }


end

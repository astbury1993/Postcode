# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'unit_test.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = Import.new
    t.row_id = row['row_id']
    t.text = row['text']
    t.save
    if t.save
        puts "#{t.row_id}, #{t.text} saved"
        else
        u = Failed.new
        u.row_id = row['row_id']
        u.text = row['text']
        u.save
        puts "#{u.row_id}, #{u.text} failed"
    end
    
end

puts "There are now #{Import.count} rows in the import table"
puts "There are now #{Failed.count} rows in the failed table"

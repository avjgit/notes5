require 'csv'
require 'geocoder'

Geocoder.configure(:lookup => :bing, :api_key => '')

source_filename = 'register.csv'
target_filename = 'register_edited.csv'
processed_filename = 'register_geocoded.csv'

# File.open(source_filename) { |source_file|
#   contents = source_file.read
#   contents.gsub!('"', '')
#   File.open(target_filename, "w+") { |f| f.write(contents) }
# }

File.open(processed_filename, 'w') do |fo|
  File.foreach(target_filename) do |line|

	data_array =  line.split(';')
	address = data_array[10]
	geocode = Geocoder.search(address)[0]
	latitude  = geocode ? geocode.latitude.to_s : 'unknown'
	longitude = geocode ? geocode.longitude.to_s : 'unknown'
	new_line =  latitude + ';' + longitude + ';' + data_array.join(';')    
    fo.puts new_line
  end
end
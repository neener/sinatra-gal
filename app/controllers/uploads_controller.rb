class UploadsController < ApplicationController
	post '/upload' do
		# Check if use uploaded a file
		if params[:image] && params[:image][:filename]
			filename = params[:image][:filename]
			file = params[:image][:tempfile]
			path = "./public/uploads/#{filename}"

			# Write file to disk
			File.open(path, 'wb') do |f|
				f.write(file.read)
			end
		end
	end
end

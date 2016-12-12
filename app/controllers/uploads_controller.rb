class UploadsController < ApplicationController

	get '/uploads' do
		erb :'uploads/create_upload'
	end

	post '/uploads' do
		# Check if user uploaded a file
		if params[:upload] && params[:upload][:filename]
			filename = params[:upload][:filename]
			file = params[:upload][:tempfile]
			path = "./public/uploads/#{filename}"

			# Write file to disk
			File.open(path, 'wb') do |f|
				f.write(file.read)
			end
		end

		erb :'uploads/uploads'
	end
end

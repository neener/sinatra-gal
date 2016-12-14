class UploadsController < ApplicationController


	post '/uploads' do
		
		@category = Category.find_by_id(params[:category_id])
		@filename = params[:file][:filename]
  		file = params[:file][:tempfile]
  		@upload = Upload.new
  		@upload.image_url = @filename
  		@upload.category = @category 
  		@upload.save

  		# binding.pry


  		File.open("./public/uploads/#{@filename}", 'wb') do |f|
    		f.write(file.read)
  		end
		# Check if user uploaded a file
		# if params[:upload] && params[:upload][:filename]
		# 	filename = params[:upload][:filename]
		# 	file = params[:upload][:tempfile]
		# 	path = "./public/uploads/#{filename}"

			# Write file to disk
		# 	File.open(path, 'wb') do |f|
		# 		f.write(file.read)
		# 	end
		# end

		redirect "/categories/#{@category.id}"
	end
end

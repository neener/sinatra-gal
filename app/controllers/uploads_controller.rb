class UploadsController < ApplicationController


	post '/uploads' do
		
		@category = Category.find_by_id(params[:category_id])
		@filename = params[:file][:filename]
  		file = params[:file][:tempfile]
  		@upload = Upload.new
  		@upload.image_url = @filename
  		@upload.category = @category 
  		@upload.title = params[:title]
  		@upload.save
  		
  		File.open("./public/uploads/#{@filename}", 'wb') do |f|
    		f.write(file.read)
  		end

		redirect "/categories/#{@category.id}"
	end

	delete '/uploads/:id/delete' do
		@upload = Upload.find_by_id(params[:id])
		@upload.delete
		redirect "/categories/#{@upload.category.id}"
	end
end

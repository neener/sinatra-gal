class CategoriesController < ApplicationController

	get '/categories' do
		@categories = Category.all
		erb :'categories/categories'
	end

	get '/categories/new' do
		erb :'/categories/new'
	end

	post '/categories' do
		@category = Category.new(title: params[:title])
		if @category.save
			redirect '/categories'
		else
			erb :'/categories/new'
		end
	end
end

class BooksController < ApplicationController

	def new

	end

	def create
		@books = Book.all
		@book = Book.new(book_params)
		if @book.save
			flash[:notice] = "book was successfully created"
			redirect_to book_path(@book.id)
		else
			render 'index'
		end
	end

	def index
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

end

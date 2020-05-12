class BooksController < ApplicationController

	def new

	end

	def create
		@books = Book.all
		@book = Book.new(book_params)
		if @book.save
			flash[:notice] = "book was successfully created"
			redirect_to show_book_path(@book.id)
		else
			render 'index'
		end
	end

	def index
		@books = Book.all
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@bosh = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "book was successfuly edited"
		redirect_to book_path(@book.id)
		else
			render 'edit'
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		flash[:notice] = "book was successfully destroyed"
		redirect_to '/books'
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end

class BooksController < ApplicationController
	before_action :authenticate_user!

	def new

	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user
		@users = User.all
		if @book.save
			flash[:notice] = "book was successfully created"
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			render 'index'
		end
	end

	def index
		@books = Book.all
		@user = current_user
		@users = User.all
		@book = Book.new
	end

	def show
		@book = Book.new
		@bosh = Book.find(params[:id])
		@user = @bosh.user
		# @user = current_user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "book was successfully edited"
		redirect_to book_path(@book.id)
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		# flash[:notice] = "book was successfully destroyed"
		redirect_to '/books'
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end

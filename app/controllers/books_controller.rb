class BooksController < ApplicationController

	def index 
		@books = Book.all
	end
	
	def show  
      @book = Book.find params[:id]  
       @comments = @book.comments  
    end  
    
    def new  
      @book = Book.new  
    end  
      
    def create  
      @book = Book.new params[:book]  
      if @book.save  
        flash[:notice] = "#{@book.title} saved."  
        redirect_to @book  
      else  
        render :new  
      end  
    end 
    
    def edit  
      @book = Book.find params[:id]  
    end  
      
    def update  
      @book = Book.find params[:id]  
      if @book.update_attributes(params[:book])  
        flash[:notice] = "#{@book.title} saved."  
        redirect_to @book  
      else  
        render :edit  
      end  
    end  
      
    def destroy  
      book = Book.find params[:id]  
      book.destroy  
      flash[:notice] = "#{book.title} deleted."  
      redirect_to books_path  
    end  
    
    
    
    

end

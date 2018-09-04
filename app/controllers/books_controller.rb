class BooksController < ApplicationController
    
    def index
        books = Book.all
        respond_to do |format| 
            format.json {render json: "{\"name\":\"Katherine\"}", status:200}
            format.html {render html: "{\"name\":\"Katherine\"}", status:200}

        end
    end
    
    def create
        book = Book.new(params_book)
        if book.save
            respond_to do |format| 
            format.json {render json: "{\"name\":\"Alejandro\"}", status:201}
            end
        else
            respond_to do |format| 
            format.json {render json: book.errors, status: unprocessable_enty}
            end
        end
    end
    
    def params_book
        params.permit(:name, :year, :code, :available)
    end    
    
    def show
        book = Book.find(params[:id])
        respond_to do |format| 
            format.json {render json: book, status:200}
            format.html {render html: book, status:200}

        end
    end
end

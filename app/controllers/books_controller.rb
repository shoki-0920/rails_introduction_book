class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @books = Book.all
    end

    def show
       
    end

    def new
        @book = Book.new
    end

    def create
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "家計簿にデータを1件登録しました"
        redirect_to books_path
      else
       flash.now[:alert] = "登録に失敗しました"
       render :new
      end
    end

    def edit
        
    end

    def update
        
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        if @book.update(book_params)
          flash[:notice] = "データを一件更新しました"
          redirect_to books_path
        else
          flash.now[:notice] = "更新に失敗しました"
          render :edit
        end
    end

    def destroy
        
        @book.destroy
        flash[:notice] = "削除しました"
        redirect_to books_path
    end

    private

    def set_book
      @book = find(params[:id])
    end
    

end
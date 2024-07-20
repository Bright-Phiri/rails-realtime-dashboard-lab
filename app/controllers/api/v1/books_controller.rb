# frozen_string_literal: true

class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    render json: Book.all
  end

  def show
    render json: @book
  end

  def create
    author = Author.find(params[:author_id])
    book = author.books.create(book_params)
    if book.persisted?
      ActionCable.server.broadcast 'dashbaord_channel', { books_count: Book.count, authors_count: Author.count }
      render json: book, status: :created
    else
      render json: book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: @book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy!
    head :no_content
  end

  private

  def book_params
    params.require(:Book).permit(:isbn, :name, :publisher, :quantity, :section)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end

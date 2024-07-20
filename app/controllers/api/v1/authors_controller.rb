# frozen_string_literal: true

class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update ,:destroy]
  def index
    render json: Author.all
  end

  def show
    render json: @author
  end

  def create
    author = Author.new(author_params)
    if author.save
      render json: author, status: :created
    else
      render json: author.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      render json: @author, status: :ok
    else
      render json: @author.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy!
    head :no_content
  end

  private

  def author_params
    params.require(:author).permit(:name, :phone, :email)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end

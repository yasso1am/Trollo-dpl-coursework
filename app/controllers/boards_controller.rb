class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  
  def index
    @boards = Board.all
  end
 
  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
      if @board.save
        @board.priority = @board.id
        @board.save
        redirect_to board_path(@board), notice: 'Board created'
      else
        render :new
      end
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: 'Board updated'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: 'Board Deleted'
  end


  private

    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:title, :priority)
    end


end

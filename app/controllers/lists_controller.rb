class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = @board.lists #.all is implied
  end
 
  def show
  end

  def new
    @list = @board.lists.new
  end

  def edit
  end

  def create
    @list = @board.lists.new(list_params)
      max = @board.lists.maximum('priority')
        @list.priority = max + 1
      if @list.save
        redirect_to [@board, @list], notice: 'list created'
      else
        render :new
      end
  end

  def update
    if @list.update(list_params)
      redirect_to [@board, @list], notice: 'list updated'
    else
      render :edit
    end
  end

 
  def destroy
    @list.destroy
    redirect_to board_lists_path(@board), notice: 'List Deleted'
  end


  private

    def set_board
      @board = Board.find(params[:board_id])
    end


    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :priority)
    end
end

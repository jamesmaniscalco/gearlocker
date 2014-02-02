class ItemsController < ApplicationController
  before_filter :authenticate_group!
  before_filter :find_item, :only => [ :show, :edit, :update, :destroy ]


  def index
    @items = current_group.items
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.group = current_group

    if @item.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  protected

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:group_id, :name, :description, :id)
  end
end

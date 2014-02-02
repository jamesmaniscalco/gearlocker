class ItemsController < ApplicationController
  before_filter :authenticate_group!
  before_filter :find_item, :only => [ :show, :edit, :update, :destroy ]


  def index
    @items = current_group.items.order(name: :asc)
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
    if @item.update(item_params)
      redirect_to items_path
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy

    redirect_to items_path
  end


  protected

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:group_id, :name, :description, :id)
  end
end

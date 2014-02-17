class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end

  def edit
  end

  def show
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to items_path
  	else
  		render 'new'
  	end
  end

  private

  def item_params
  	params.require(:item).permit(:item_name, :amount, :price, :user_id)
  end
end

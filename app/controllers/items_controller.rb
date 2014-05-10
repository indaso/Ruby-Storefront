class ItemsController < ApplicationController
  def index
  	#@items = Item.order(params[:sort]).paginate(:per_page => 5, :page => params[:page])
    @items = Item.search(params[:search]).order(params[:sort]).paginate(:per_page => 5, :page => params[:page])
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = "Item was updated."
      redirect_to item_path(@item.id)
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item was deleted."
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
      Notifications.new_item(@item).deliver
      flash[:notice] = "Item was created."
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

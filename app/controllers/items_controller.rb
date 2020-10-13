class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    unless @item.valid?
      render :new and return
    end

    @item.save
    redirect_to root_path
  end
  


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :prefecture_id, :condition_id, :category_id, :postage_type_id, :preparation_day_id, :image).merge(user_id: current_user.id)
  end

end

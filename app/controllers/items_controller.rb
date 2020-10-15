class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_edit, except: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def edit
    if @item.user == current_user
      render 'edit'
    else
      redirect_to item_path
    end
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_edit
    redirect_to root_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :prefecture_id, :condition_id, :category_id, :postage_type_id, :preparation_day_id, :image).merge(user_id: current_user.id)
  end
end

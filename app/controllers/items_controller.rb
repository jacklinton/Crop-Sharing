class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:update, :show, :edit]
  
  
  def _form
  end

  def new
  end

  def create
    @item = Item.new(params[:item])
      respond_to do |items|
        if @item.save
          items.html { redirect_to @item, notice: "Item added Successfully"}
          items.js
        else
          items.html { render action: "new" }
        end
      end
  end
  
  def edit
  end
end

private

def set_item
  @item = Item.find(params[:id])
end

def item_params
  params.require(:item).permit(:event_id, :user_id, :name, :description)
end
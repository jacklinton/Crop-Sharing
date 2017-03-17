class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:update, :show, :edit]
  
  
  def _form
  end

  def new
  end

  def create
    @event = Event.last
    @item = Item.new(event_id: @event.id)
    @item.update_attributes!(item_params)
        if @item.save
          render @item
        else
          render action: "new"
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
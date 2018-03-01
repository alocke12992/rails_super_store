class ItemsController < ApplicationController
  before_action :set_dept
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = @dept.items
  end

  def show 
  end 

  def new
    @item = @dept.items.new
    render partial: 'form'
  end

  def edit
    render partial: "form"
  end

  def create 
    @item = @dept.items.new(item_params)

    if @item.save
      redirect_to dept_items_path[@dept, @item]
    else 
      render :new 
    end 
  end 


  private 

  def set_item 
    @item = Item.find(params[:id])
  end 

  def set_dept 
    @dept = Dept.find(params[:dept_id])
  end 

  def item_params
    params.require(:item).permit(:name, :desc, :img, :price)
  end 

end

class DeptsController < ApplicationController
  before_action :set_dept, only: [:show, :update, :edit, :destroy]
  def index
    @depts = Dept.all 
  end

  def show
  end 

  def new
    @dept = Dept.new 
  end



  def create 
    @dept = Dept.create(dept_params)

    if @dept.save
      redirect_to root_path
    else 
      render :new 
    end 

  end 

  

  def edit
  end

  private 

    def set_dept 
      @dept = Dept.find(params[:id])
    end 

    def dept_params 
      params.require(:dept).permit(:name)
    end
end

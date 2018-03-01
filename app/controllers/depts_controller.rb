class DeptsController < ApplicationController
  def index
    @depts = Dept.all 
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
    def dept_params 
      params.require(:dept).permit(:name)
    end
end

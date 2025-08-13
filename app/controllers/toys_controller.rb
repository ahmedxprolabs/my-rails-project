class ToysController < ApplicationController
  def index
    @toys = Toy.all
  end

  def show
    @toy = Toy.find(params[:id])
  end
  
  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      redirect_to @toy, notice: "Toy created successfully!"
    else
      render :new
    end
  end

  def helpers_demo
    @date = Date.today
    @number = 1234567.89
    @html_text = "<b>Bold text</b> and <a href='https://example.com'>a link</a>"
  end

  private

  def toy_params
    params.require(:toy).permit( :name, :price, :in_stock, :description )
  end
end

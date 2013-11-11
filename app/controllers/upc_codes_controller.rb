class UpcCodesController < ApplicationController
  def create
    p params
    @upc_image = UpcCode.new(params[:upc_code])
    if @upc_image.save
      redirect_to @upc_image
    else
      p "EVERYTHING'S FUCKED!" * 50
    end
  end

  def show
  end
end
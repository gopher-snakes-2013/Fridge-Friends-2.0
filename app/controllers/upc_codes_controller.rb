class UpcCodesController < ApplicationController
  def create
    @upc = UpcCode.new(params[:upc_code])
    @upc.save
    fridge_id = params[:fridge_id]
    redirect_to fridge_upc_code_path(fridge_id, @upc.id)
  end

  def show
    @upc = UpcCode.find(params[:id])
  end
end
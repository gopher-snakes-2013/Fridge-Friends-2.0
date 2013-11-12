class UpcCodesController < ApplicationController
  def create
    @upc = UpcCode.new(params[:upc_code])
    @upc.fridge_id = params[:fridge_id]
    @upc.upc_img_file_name = SecureRandom.hex(10)
    if @upc.save
      @upc.update_attributes(upc_text: @upc.process_image)
      if @upc.upc_text.length <= 13
        @upc.update_attributes(item_name: @upc.grab_product_info(@upc.upc_text))
      else
        @upc.update_attributes(item_name: @upc.upc_text)
      end
      @upc.upc_img = nil
      @upc.save
    end
    redirect_to fridge_upc_code_path(@upc.fridge_id, @upc.id)
  end

  def show
    @upc = UpcCode.find(params[:id])
    @fridge = Fridge.find(@upc.fridge_id)
    @item = Item.new
  end
end
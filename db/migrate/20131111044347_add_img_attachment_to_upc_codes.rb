class AddImgAttachmentToUpcCodes < ActiveRecord::Migration
  def change
    add_attachment :upc_codes, :upc_img
  end
end

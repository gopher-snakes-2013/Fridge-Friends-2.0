class UpcCode < ActiveRecord::Base
  attr_accessible :upc_img
  has_attached_file :upc_img, :default_url => "/images/:style/missing.png"
end
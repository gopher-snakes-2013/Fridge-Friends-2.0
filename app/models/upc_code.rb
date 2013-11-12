require 'json'
require 'rest_client'
require 'rexml/document'
require 'base64'

class UpcCode < ActiveRecord::Base
  attr_accessible :upc_img, :upc_text, :item_name, :fridge_id
  has_attached_file :upc_img,
                    :path => ":rails_root/public/system/images/upc/:id/:basename:extension",
                    :url => "/system/images/upc/:id/:basename:extension"

  APPLICATION_ID = CGI.escape(ENV["OCR_APPLICATION_ID"])
  PASSWORD = CGI.escape(ENV["OCR_PASSWORD"])
  BASE_URL = "http://#{APPLICATION_ID}:#{PASSWORD}@cloud.ocrsdk.com"
  LANGUAGE = "English"

  def output_response_error(response)
    xml_data = REXML::Document.new(response)
    puts "Error: #{xml_data.elements["error/message"].text}" if xml_data.elements["error/message"]
  end

  def process_image
    image_file = "public/system/images/upc/#{self._id}/#{self.upc_img_file_name}"

    begin
      response = RestClient.post("#{BASE_URL}/processImage?profile=barcodeRecognition&exportFormat=xml", :upload => { :file => File.new(image_file, 'rb') })  
    rescue RestClient::ExceptionWithResponse => e
      output_response_error(e.response)
      raise
    else
      xml_data = REXML::Document.new(response)
      task_id = xml_data.elements["response/task"].attributes["id"]
    end


    begin
      response = RestClient.get("#{BASE_URL}/getTaskStatus?taskid=#{task_id}")
    rescue RestClient::ExceptionWithResponse => e
      output_response_error(e.response)
      raise
    else
      xml_data = REXML::Document.new(response)
      task_status = xml_data.elements["response/task"].attributes["status"]
    end until task_status == "Completed"

    download_url = xml_data.elements["response/task"].attributes["resultUrl"]

    RestClient.get(download_url)
    ocr_result = RestClient.get(download_url)
    if xml_result = ocr_result[/<formatting lang="">.*<\/formatting>/]
      xml_result.gsub!(/<formatting lang="">/, "")
      xml_result.gsub!(/<\/formatting>/, "")
      return xml_result
    else
      return "Sorry, UPC Not Found"
    end
  end

  def grab_product_info(upc_code)
    upc_access = ENV["UPC_ACCESS_TOKEN"]

    upc_url = "http://www.searchupc.com/handlers/upcsearch.ashx?request_type=3&access_token=#{upc_access}&upc=#{upc_code}"

    product_info = RestClient.get(upc_url)
    parsed_json = JSON.parse(product_info)

    if parsed_json["0"]["productname"]
      return parsed_json["0"]["productname"]
    else
      return "Sorry, UPC Not Found"
    end
  end
end
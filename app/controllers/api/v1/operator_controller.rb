class Api::V1::OperatorController < ApplicationController

  def clean_signal
    data      = (params.has_key?(:data) && !params[:data].blank?) ? params[:data] : nil
    threshold = (params.has_key?(:threshold) && !params[:threshold].blank?) ? params[:threshold] : nil

    if data.nil? || threshold.nil?
      return render json: {
        message: "Please enter appropriate parameters."
      }, status: :bad_request
    end

    output_list = []
    data.each do |item|
      if item < threshold
        output_list << 0
      else 
        output_list << 1
      end
    end

    return render json: {
      signal: output_list
    }
  end

  
  def clean_file
    threshold = (params.has_key?(:threshold) && !params[:threshold].blank?) ? params[:threshold] : nil
    return render json: { message: "Please enter the threshold parameter." }, status: :bad_request if threshold.nil?

    file_name = "device_data.json"
    path = File.join("#{Rails.root}/public/", "#{file_name}")
    return render json: { message: "Device data does not exist at given location." }, status: :internal_server_error if !File.exist?(path)

    parsed_json = JSON.parse(open(path).read)
    output_list = []
    device_table_data = []
    parsed_json['data'].each do |element|
      table_data = {
        noise: element,
        threshold: threshold.to_i
      }
      if element < threshold.to_i
        output_list << 0
        table_data[:signal] = 0
      else 
        output_list << 1
        table_data[:signal] = 1
      end
      device_table_data << table_data
    end
    # Persist input and output signal along with threshold value to database
    DeviceSignal.create(device_table_data) if device_table_data.length > 0

    return render json: {
      signal: output_list
    }
  end
end

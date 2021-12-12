class Api::V1::OperatorController < ApplicationController

  def clean
    data      = params[:data] || nil
    threshold = params[:threshold] || nil

    if data.nil? || threshold.nil?
      return render json: {
        message: "Please enter appropriate parameters"
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
end

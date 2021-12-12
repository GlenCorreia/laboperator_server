class OperatorController < ApplicationController

  def clean
    data = params[:data] || nil
    threshold = params[:threshold] || nil

    if data.nil? || threshold.nil?
      return render json: {
        message: "Please enter appropriate parameters"
      }, status: :bad_request
    end
  end
end

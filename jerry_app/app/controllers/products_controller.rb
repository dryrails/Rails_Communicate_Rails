class ProductsController < ApplicationController
  before_action :do_validation, only: :index

  def index
    render json: {code: 200, message: "Success"}
  end

  private

  def do_validation
    timestamp = params[:timestamp].to_i
    token = params[:token]

    if timestamp.blank? || token.blank?
      return render json: {code: 400, message: "timestamp or token can't be blank"}, status: 400
    end

    time_now = Time.now.to_i
    if time_now - timestamp > 300 || time_now < 0
      return render json: {code: 400, message: "Timestamp is expired"}, status: 400
    end

    str = APP_ID + timestamp.to_s
    hex_token = OpenSSL::HMAC.hexdigest("SHA1", APP_KEY, str)

    if token != hex_token
      return render json: {code: 401, message: "token is wrong"}, status: 401
    end

  end
end
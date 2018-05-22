class RedisServiceController < ApplicationController
  def get
    send_data(
      Redis.new.get(params[:key]),
      disposition: :inline,
      type: "image/jpg"
    )
  end
end

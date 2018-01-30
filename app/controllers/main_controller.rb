class MainController < ApplicationController
  def index
    linear_params = { type: 'linear', a: 1, b: 2 }
    quadratic_params = { type: 'quadratic', a: 1, b: 2, c: -3 }
    puts linear_result = request_sender.send_request(linear_params)
    puts quadratic_result = request_sender.send_request(quadratic_params)
  end

  def request_sender
    @request_sender ||= RequestSender.new
  end
end

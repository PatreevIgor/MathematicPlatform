class MainController < ApplicationController
  def index
    @linear_result    = params[:linear_result]['result']    unless params[:linear_result].nil?
    @quadratic_result = params[:quadratic_result]['result'] unless params[:quadratic_result].nil?
  end
end

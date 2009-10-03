class TurbinesController < ActionController::Base
  layout "application"
  helper FusionHelper

  def index
  end
  
  def chart
    @id = params[:id]
    if params[:week]
      @data_string = "?week=#{params[:week]}"
    end
  end

end


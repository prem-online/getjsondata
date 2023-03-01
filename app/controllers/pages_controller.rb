class PagesController < ApplicationController
  def home
    data = FakerList.new
    @data = data.get_data.sort
  end
end

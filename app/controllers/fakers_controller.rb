class FakersController < ApplicationController
    def index
        # call service faker list
        data = FakerList.new
        data = data.get_data
        render json: data
    end
  end
  
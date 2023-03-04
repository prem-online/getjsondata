class FakersController < ApplicationController
    before_action :clean_params, only: :index
    skip_before_action :verify_authenticity_token
    def index
        data_class, quantity = fake_data_params
        return render json: {error: "Quantity can't be more than 1000"} if quantity > 1000
        fake_list = FakerList.new
        result = fake_list.get_data(data_class,quantity)
        render json: {type: data_class, attributes: {"data"=>result}}, status: :ok
    end

    private

    def clean_params
        params[:data_quantity] = 10 unless params[:data_quantity].present?
        params[:data_quantity] = params[:data_quantity].to_i
    end

    def fake_data_params
        [params[:data_class],params[:data_quantity]]
    end
end
  
class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

get "/bakeries" do
  bakeries = Bakery.all
  bakeries.to_json
end

get "/bakeries/:id" do
  bakery = Bakery.find(params[:id])
  bakery.to_json(only:[:name], include:{
    baked_goods:{only:[:name, :price]}
  })
end

get "/baked_goods/most_expensive" do
  most_expensive_good = BakedGood.most_expensive
  most_expensive_good.to_json
end

get "/baked_goods/by_price" do
  filter_by_price = BakedGood.order_by_price
  filter_by_price.to_json
end


end

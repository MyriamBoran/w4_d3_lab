require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')


get '/pizza_orders' do  #index
  @orders = PizzaOrder.all
  erb(:index)
end

get '/pizza_orders/new' do  #new
  erb(:new)
end

get '/pizza_orders/:id' do  #show
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizza_orders' do  #create
  @order = PizzaOrder.new(params)
  @order.save
  erb(:create)
end

get '/pizza_orders/:id/update' do
  @order = PizzaOrder.find(params[:id])
  erb(:update)
end

post '/pizza_orders/:id' do   #update
  @order = PizzaOrder.new(params)
  @order.update
  redirect to '/pizza_orders'
end

post '/pizza_orders/:id/delete' do  #delete
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect to '/pizza_orders'
end

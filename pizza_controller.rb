require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( './models/pizza_order' )
also_reload( './models*' )

# INDEX - Display all pizzas
get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

# NEW - Display form to create a new pizza order
get "/pizza-orders/new" do
  erb(:new)
end

# CREATE - Create a database entry for the new pizza order
post "/pizza-orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# SHOW - Disaply one pizza
get "/pizza-orders/:id" do
  @order = PizzaOrder.find(params[:id])
  @order.update()
  erb(:show)
end

# EDIT - Display from to edit a pizza order's details
get "/pizza-orders/:id/edit" do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# UPDATE - Updates a database entry for the edited pizza order
post "/pizza-orders/:id" do
  @order = PizzaOrder.new(params)
  @order.update()
  erb(:show)
end


# DELETE - Deletes a pizza order from the database
post "/pizza-order/:id/delete" do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  erb(:delete)
end

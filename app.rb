require 'sinatra'
require 'sinatra/flash'
require_relative './models'
require_relative './class'

enable :sessions

get "/" do
    
    erb :index
end

get "/cars" do
@cars=[
    @gwagon = Cars.new("Mercedez","G-Wagon", 2020, "https://file.kbb.com/kbb/vehicleimage/evoxseo/xl/12775/2018-mercedes-benz-g-class-front-angle3_12775_089_480x360.jpg"),
    @lambo = Cars.new("Lamborghini", "Murcielago", 2020, "https://upload.wikimedia.org/wikipedia/commons/6/62/Lamborghini_Murci%C3%A9lago_in_Thailand.JPG"),
    @bugatti = Cars.new("Bugatti", "Chiron", 2020, "https://assets.bugatti.com/fileadmin/_processed_/sei/p54/se-image-4d7e0aefef47f54a3b7f7c4c8d619141.jpg"),
    @mclaren = Cars.new("McLaren", "P1", 2019, "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/McLaren_P1.jpg/1200px-McLaren_P1.jpg"),
    @tesla = Cars.new("Tesla","Model-S", 2020, "https://www.tesla.com/content/dam/tesla-site/sx-redesign/img/socialcard/MS.jpg"),
    @phatom = Cars.new("Rolls-Royce", "Phantom", 2019, "data:image/jpeg;base64,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")
    ]
    erb :cars
end

get "/customers" do

    erb :customers
end

get "/about" do

    erb :about
end

get '/users' do
    
    @users = User.all
  
    
    erb :users
  end

get "/signup" do
    erb :signup
end

post "/signup" do
    user = User.create(
        username: params[:username],
        password: params[:password],
        email: params[:user_email],
        car: params[:car]
    )

    session[:user_id] = user.id

    redirect "/users"

end

get "/signin" do 
    erb :signin
end

post "/signin" do 
    user = User.find_by(username: params[:username])

    if user && user.password == params[:password]

        session[:user_id]=user.id

        flash[:info] = 'You have been signed in'


    else
        
        flash[:error] = 'There was a problem with your signin'
        redirect "/signin"

        
    end
    
    erb :admin
    

end

get "/admin" do
    erb :admin
end

get "/blog" do

    @posts = Post.all

    erb :blog

end

post "/admin" do
 post = Post.create(
     post_username: params[:post_username],
     user_id: params[:id],
     comment: params[:comment]
 )



 redirect "/blog"

 end



get "/signout" do
    session[:user_id] = nil

    redirect "/"
end

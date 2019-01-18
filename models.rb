require 'sinatra/activerecord'
require 'pg'

# set :database, 'postgresql:aronbook'
ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: 'ling'
  )

class User < ActiveRecord::Base
    has_many :posts
end

class Post < ActiveRecord::Base
    belongs_to :user
end
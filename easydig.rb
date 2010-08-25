require 'rubygems'
require 'sinatra'
require 'public_suffix_service'
require 'haml'

set :haml, {:format => :html5 }

get '/' do
  haml :index
end

get '/dig/:domain_name' do
  # sanitize params
  domain_name = params[:domain_name]
  if PublicSuffixService.valid?(domain_name)
    "<pre>" + `dig #{domain_name}` + "</pre>" 
  else
    "invalid input"
  end
end
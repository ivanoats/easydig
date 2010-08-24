require 'rubygems'
require 'sinatra'
require 'public_suffix_service'
get '/' do
  "What do you want to dig?"
end

get '/dig/:what' do
  # sanitize params
  domain_name = params[:what]
  if PublicSuffixService.valid?(domain_name)
    "<pre>" + `dig #{domain_name}` + "</pre>" 
  else
    "invalid input"
  end
end
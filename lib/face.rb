require 'rubygems'
require 'rest_client'
require 'json'

require File.expand_path('../face/client', __FILE__)

module Face
  
  def self.get_client(opts={})
    Face::Client::Base.new(opts)
  end
  
end

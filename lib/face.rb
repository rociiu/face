require 'rubygems'
require 'ruby-debug'
require 'rest_client'
require 'json'
require 'pp'

require File.expand_path('../face/client', __FILE__)

module Face
  
  def self.get_client(opts={})
    Face::Client::Base.new(opts)
  end
  
end

#client = Face.get_client(:api_key => '1a16f5a64ae7f87677f8d16e621cb918', :api_secret => '2fb4249e299ed6a01cb38145837b9525')
#pp client.faces_detect(:urls => ['http://farm6.static.flickr.com/5220/5431220348_fbdf80ae9.jpg'])
##pp client.faces_detect(:file => File.new('5431220348_fbdf810ae9.jpg', 'rb'))
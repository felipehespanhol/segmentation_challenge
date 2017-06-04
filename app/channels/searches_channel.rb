class SearchesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'searches'
  end
end  

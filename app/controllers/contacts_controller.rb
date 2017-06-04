class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @segments_list = Segment.all
  end
end

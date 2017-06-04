class ContactsController < ApplicationController
  def index
    @segments_list = Segment.all
    @search_segments = Segment.where(id: params[:segments_ids])
    @contacts = Contact.search_with_segments(@search_segments)
  end
end

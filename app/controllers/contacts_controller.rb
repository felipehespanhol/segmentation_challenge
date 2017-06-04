class ContactsController < ApplicationController
  def index
    @segments_list = Segment.all
    @search_segments = Segment.where(id: params[:segments_ids])
    @contacts = Contact.search_with_segments(@search_segments)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      flash[:alert] = I18n.t('errors.messages.model_invalid', errors: @contact.errors.size)
      render :new
    end
  end

  private

  def contact_params
    params.fetch(:contact, {}).permit(:name, :email, :state, :age, :job)
  end
end

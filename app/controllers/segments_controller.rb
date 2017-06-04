class SegmentsController < ApplicationController
  def index
    @segments = Segment.all.order(name: :asc)
  end

  def new
    @segment = Segment.new
    @segment.conditions.build
  end

  def create
    @segment = Segment.new(segment_params)
    if @segment.save
      redirect_to contacts_path
    else
      flash[:alert] = I18n.t('errors.messages.model_invalid', errors: @segment.errors.size)
      render :new
    end
  end

  def destroy
    @segment = Segment.find(params[:id])
    @segment.destroy
    redirect_to segments_path
  end

  private

  def segment_params
    params.fetch(:segment, {}).permit(:name, conditions_attributes: [:field, :name, :term])
  end
end

class SegmentsController < ApplicationController
  def index
    @segments = Segment.all.order(name: :asc)
  end

  def new
    @segment = Segment.new
    @segment.conditions.build
  end

  def create
    if @segment = Segment.create(segment_params)
      redirect_to contacts_path
    else
      render :new
    end
  end

  private

  def segment_params
    params.require(:segment).permit(:name, conditions_attributes: [:field, :name, :term])
  end
end

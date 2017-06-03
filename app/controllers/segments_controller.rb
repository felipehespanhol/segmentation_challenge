class SegmentsController < ApplicationController
  def index
    @segments = Segment.all.order(name: :asc)
  end

  def new
    @segment = Segment.new
  end
end

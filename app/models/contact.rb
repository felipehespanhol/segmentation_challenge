# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  age        :integer
#  state      :string
#  job        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
  def self.with_segment(segment)
    shared_context = Ransack::Context.for(self)

    searches = segment.conditions.map do |condition, term|
      self.ransack({ condition: term }, context: shared_context)
    end

    shared_conditions = searches.map { |search| Ransack::Visitor.new.accept(search.base) }

    self.joins(shared_context.join_sources)
      .where(shared_conditions.reduce(&:or))
  end
end

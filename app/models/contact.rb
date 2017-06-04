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
  validates :name, :email, :state, :age, :job, presence: true
  validates_numericality_of :age

  def self.search_with_segments(segments)
    shared_context = Ransack::Context.for(self)

		search_ransacks = segments.map {|s| self.ransack(s.search_hash, context: shared_context)}

		shared_conditions = search_ransacks.map { |search|
			Ransack::Visitor.new.accept(search.base)
		}

		self.where(shared_conditions.reduce(&:or))
  end
end

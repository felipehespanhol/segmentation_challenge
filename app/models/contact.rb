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
    segments.inject(self.all) do |result, segment|
      result.ransack(segment.search_hash).result
    end.order(name: :asc)
  end
end

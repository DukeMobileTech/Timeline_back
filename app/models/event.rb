# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id           :bigint           not null, primary key
#  interview_id :integer
#  label        :string
#  description  :text
#  event_date   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :interview
  validates :interview_id, presence: true
  validates :label, presence: true, inclusion: { in: Rails.configuration.event_types,
                                                 message: '%{value} is not a valid event type' }
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: participants
#
#  id               :bigint           not null, primary key
#  new_id           :integer
#  participant_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  site             :string
#

class Participant < ApplicationRecord
  has_many :interviews
  has_many :events, through: :interviews

  validates :new_id, presence: true
  validates :participant_type, presence: true, inclusion: { in: Rails.configuration.participant_types,
                                                            message: '%{value} is not a valid participant type' }
  validates :site, presence: true, inclusion: { in: Rails.configuration.sites,
                                                message: '%{value} is not a valid residence type' }
end

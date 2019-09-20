# frozen_string_literal: true

# == Schema Information
#
# Table name: interviews
#
#  id                     :bigint           not null, primary key
#  participant_id         :integer
#  round                  :integer
#  interview_date         :datetime
#  age                    :integer
#  grade                  :string
#  in_site_since          :integer
#  current_residence_type :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Interview < ApplicationRecord
  belongs_to :participant
  has_many :events

  validates :participant_id, presence: true
  validates :round, presence: true
  validates :interview_date, presence: true
  validates :current_residence_type, inclusion: { in: Rails.configuration.residence_types,
                                                  message: '%{value} is not a valid residence type' }
end

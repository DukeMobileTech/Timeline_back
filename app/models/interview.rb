# frozen_string_literal: true

# == Schema Information
#
# Table name: interviews
#
#  id                     :bigint           not null, primary key
#  participant_identifier :integer
#  round                  :integer
#  interview_date         :datetime
#  age                    :integer
#  grade                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  discarded_at           :datetime
#  identifier             :integer
#

class Interview < ApplicationRecord
  include Discard::Model
  belongs_to :participant, foreign_key: :participant_identifier, primary_key: :identifier
  has_many :events, foreign_key: :interview_identifier, primary_key: :identifier

  validates :participant_identifier, presence: true
  validates :round, presence: true
  validates :interview_date, presence: true
end

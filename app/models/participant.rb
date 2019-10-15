# frozen_string_literal: true

# == Schema Information
#
# Table name: participants
#
#  id               :bigint           not null, primary key
#  identifier       :integer
#  participant_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  site             :string
#  discarded_at     :datetime
#

class Participant < ApplicationRecord
  include Discard::Model
  has_many :interviews, foreign_key: :participant_identifier, primary_key: :identifier
  has_many :events, through: :interviews

  validates :identifier, presence: true
  validates :participant_type, presence: true
  validates :site, presence: true
end

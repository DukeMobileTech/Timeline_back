# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id                   :bigint           not null, primary key
#  interview_identifier :integer
#  title                :string
#  description          :text
#  time                 :datetime
#  uuid                 :string
#  discarded_at         :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Event < ApplicationRecord
  include Discard::Model
  belongs_to :interview, foreign_key: :interview_identifier, primary_key: :identifier
  validates :interview_identifier, presence: true
  validates :title, presence: true
  validates :time, presence: true
end

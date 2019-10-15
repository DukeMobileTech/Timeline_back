# frozen_string_literal: true

class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all.includes(:interviews, events: [:interview])
  end
end

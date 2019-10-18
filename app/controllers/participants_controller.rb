# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @participants = Participant.includes(:interviews, events: [:interview]).where(site: current_user.sites)
  end
end

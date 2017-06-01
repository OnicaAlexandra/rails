class EventParticipantsController < ApplicationController
  def new
    @e_part = Event_participant.new
  end
end

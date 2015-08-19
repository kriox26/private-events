class InvitesController < ApplicationController
  before_action :correct_user , only: [ :create , :destroy ]

  def create
	@event = Event.find(params[:attended_event_id])
    current_user.invites.create(attended_event_id: @event.id)
	respond_to do |format|
	  format.html { redirect_to @event }
	  format.js
	end
  end

  def destroy
	@invite = Invite.find(params[:id])
	current_user.invites.destroy(@invite)
	respond_to do |format|
	  format.html { redirect_to @event }
	  format.js
	end
  end

  private

	def correct_user
	  !current_user?(User.find(Event.find(params[:id]).creator_id))
	end

end

class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
    @users_list = User.all
  end
 
  def create
    @invitation = Invitation.new(atendee_params)
    
    if @invitation.save
      flash[:success] = "Invitantion successfully created"
      redirect_to new_invitation_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private
  
  def atendee_params
    params.require(:invitation).permit(:attended_event_id, :attendee_id)
  end
end

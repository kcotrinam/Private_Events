class InvitationsController < ApplicationController
  
  def new
    @invitation = Invitation.new(params_antendee)
  end
  def create
    
  end
  
  def destroy
    
  end

  
  
end

class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcomming_events = Event.comming_events
    @past_events = Event.past_events
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.creator_id).name
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to @event
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def create
    @creator = current_user
    @event = @creator.events.build(event_params)
    if @event.save
      redirect_to :action => 'index'
    else
      render 'new'
    end
  end

  private 
    def event_params 
      params.require(:event).permit(:title, :venue, :date)
    end 
end

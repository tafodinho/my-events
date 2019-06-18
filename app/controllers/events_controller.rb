class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.build(event_params)
    if @event.save
      
    else
      render 'new'
    end
  end

  private 
    def event_params 
      params.require(:event).permit(:title, :venue, :date)
    end 
end

class UserEventsController < ApplicationController
    def create 
        event_id = params[:id]
        user_event = UserEvent.new(attendee_id: current_user.id, attended_event_id: event_id)
        puts current_user.id
        if user_event.save 
            flash[:success] = "Successfully subscribed"
            redirect_to events_path
        else
            flash[:danger] = "Failed to subscribe"
            redirect_to events_path
        end
    end
end

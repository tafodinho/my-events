class UserEventsController < ApplicationController
    def create 
        event_id = params[:id]
        user_event = UserEvent.new(attendee_id: current_user.id, attended_event_id: event_id)
        existing_user_event = UserEvent.find_by(attendee_id: current_user.id, attended_event_id: event_id)
        if existing_user_event == nil
            if user_event.save 
                flash[:success] = "Successfully subscribed"
                redirect_to events_path
            else
                flash[:danger] = "Failed to subscribe"
                redirect_to events_path
            end
        else
            flash[:success] = "You have already subscribed to event"
            redirect_to events_path
        end
    end
end

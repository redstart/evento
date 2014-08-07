class EventsController < ApplicationController

	before_action :signed_in_user, only: [:new, :create]

	def index
		@events = Event.all
		@upcoming_events = Event.upcoming.all
		@past_events = Event.past.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.created_events.build(event_params)
		if @event.save
			redirect_to @event	
		else
			render :new
		end
	end

	def show
		@event = Event.find_by(params[:id])
	end


	private

		def event_params
			params.require(:event).permit(:title, :description, :date, :location)
		end

		def signed_in_user
			unless signed_in?
			redirect_to signin_url, notice: "Please log in."
			end
		end
end

class EventsController < ApplicationController

	before_action :signed_in_user, only: [:new, :create]

	def index
		@events = Event.all
		@upcoming_events = Event.upcoming
		@past_events = Event.past
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
		@event = Event.find(params[:id])
	end

	def edit
		
	end

	def update

	end

	private

		def event_params
			params.require(:event).permit(:title, :description, :date, :location, :image)
		end
end

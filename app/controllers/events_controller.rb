class EventsController < ApplicationController

	before_action :creator?, only: [:edit, :update, :destroy]
	skip_before_action :authenticate_user!, only: [:index, :show]

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
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
	    if @event.update_attributes(event_params)&&(current_user=@event.creator)
	      flash[:success] = "Event details updated"
	      redirect_to @event
	    else
	      render :edit
	    end
	end

	def destroy
		Event.find(params[:id]).destroy
		flash[:success] = "Event deleted"
		redirect_to current_user
	end

	private

		def event_params
			params.require(:event).permit(:title, :description, :date, :location, :image)
		end
end

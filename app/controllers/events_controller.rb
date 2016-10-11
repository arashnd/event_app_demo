class EventsController < ApplicationController
  before_action :get_event, only: [:show, :edit, :destroy, :update]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)

    if event.save
      flash[:notice] = "New event created sucessfully."
      redirect_to event
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Updated Sucessfully.!"
      redirect_to @event
    else
      render "edit"
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end


  private
    def get_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :seats, :venue, :date_time)
    end
end

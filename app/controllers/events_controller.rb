class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_event, only: [:show, :edit, :destroy, :update]

  def index
    if params[:events]
      @events = current_user.events
    else
      @events = Event.all
    end
  end

  def show
  end

  def new
    @event = current_user.events.new
  end

  def create
    event = current_user.events.new(event_params)

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

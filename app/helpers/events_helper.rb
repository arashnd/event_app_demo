module EventsHelper
  def owner?
    (@event.user == current_user)? true : false
  end

  def registered?
    @event.participants.exists?(current_user)
  end

  def going
    current_user.booked_events.count
  end

end

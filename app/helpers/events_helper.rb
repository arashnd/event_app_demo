module EventsHelper
  def owner?
    (@event.user == current_user)? true : false
  end
end

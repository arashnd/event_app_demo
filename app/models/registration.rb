class Registration < ActiveRecord::Base
  belongs_to :participant, class_name: 'User', foreign_key: 'user_id'
  belongs_to :booked_event, class_name: 'Event', foreign_key: 'event_id'

end

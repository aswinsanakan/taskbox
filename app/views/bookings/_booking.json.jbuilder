json.extract! booking, :id, :room_id, :user_id, :start_date, :end_date, :created_at, :updated_at
json.url booking_url(booking, format: :json)
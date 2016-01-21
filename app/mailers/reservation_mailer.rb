class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_list_id, reservation_id)
		@host = host
		@customer = customer
		@reservation_list_id = reservation_list_id
		@reservation_id = reservation_id
		@url = "http://localhost:3000/reservations/#{@reservation_id}"
		mail(to: @host, subject: "You have received a booking from #{@customer.email}")
	end
end

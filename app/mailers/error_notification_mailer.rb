class ErrorNotificationMailer < ApplicationMailer
	def notify_owner (feeding)
		@feeding = feeding
		mail(to: @email.email1, subject: "Uh oh! We could not feed your pet...")
		mail(to: @email.email2, subject: "Uh oh! We could not feed your pet...")
	end
end

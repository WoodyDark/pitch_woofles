class ErrorNotificationMailer < ApplicationMailer
	def notify_owner (feeding)
		@feeding = feeding
		mail(to: @feeding.email, subject: "Uh oh! We could not feed your pet...")
	end
end

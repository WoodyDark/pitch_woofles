class FeedingNotificationMailer < ApplicationMailer
	def notify_owner (feeding)
		@feeding = feeding
		mail(to: @feeding.email1, subject: "Your pet has been fed!")
	end
end

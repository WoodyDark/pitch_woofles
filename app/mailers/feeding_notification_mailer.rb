class FeedingNotificationMailer < ApplicationMailer
	def notify_owner (feeding)
		@feeding = feeding
		mail(to: @feeding.email, subject: "Your pet has been fed!")
	end
end

class FeedingNotificationMailer < ApplicationMailer
	def notify_owner (feeding)
		@feeding = feeding
		mail(to: @feeding.email1, subject: "Woof, your pet has been fed!")
	end
end

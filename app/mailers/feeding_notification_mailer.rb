class FeedingNotificationMailer < ApplicationMailer
	def notify_owner (feeding)
		@feeding = feeding
		mail(to: @email.email1, subject: "Your pet has been fed!")
		mail(to: @email.email2, subject: "Your pet has been fed!")
		mail(to: @email.email3, subject: "Your pet has been fed!")
	end
end

class Feeding < ApplicationRecord
	has_many :emails
	has_many :feeding_times
end

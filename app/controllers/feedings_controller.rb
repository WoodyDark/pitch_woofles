require 'byebug'
class FeedingsController < ApplicationController


	def whenever_friendly!(input)
		if input != 'None'
			input[-3] += ' '
			input.gsub!(/\./,':')
		end
	end


	def index
		if signed_in? 
		else
			@time_selection = []
			redirect_to sign_in_path
		end
	end

	def toggle_feeding
		if params[:automated_feeding == "on"]
			redirect_to root_path
		else
		end
	end


	def new
		@feeding = Feeding.new
	end

	def create
	  @feeding = Feeding.new(feeding_params)
	   if @feeding.save
	   	redirect_to root_path, notice: "Saved"
	   else	
	   	redirect_to new_feedings_path, notice: "Failed"
	   end
	end


	def edit
	end

	def update

		@time_conversion = {
		'None' => nil,
		'12.00am' => (946684800+1800*0),
		'12.30am' => (946684800+1800*1),
		'1.00am' => (946684800+1800*2),
		'1.30am' => (946684800+1800*3),
		'2.00am' => (946684800+1800*4),
		'2.30am' => (946684800+1800*5),
		'3.00am' => (946684800+1800*6),
		'3.30am' => (946684800+1800*7),
		'4.00am' => (946684800+1800*8),
		'4.30am' => (946684800+1800*9),
		'5.00am' => (946684800+1800*10),
		'5.30am' => (946684800+1800*11),
		'6.00am' => (946684800+1800*12),
		'6.30am' => (946684800+1800*13),
		'7.00am' => (946684800+1800*14),
		'7.30am' => (946684800+1800*15),
		'8.00am' => (946684800+1800*16),
		'8.30am' => (946684800+1800*17),
		'9.00am' => (946684800+1800*18),
		'9.30am' => (946684800+1800*19),
		'10.00am' => (946684800+1800*20),
		'10.30am' => (946684800+1800*21),
		'11.00am' => (946684800+1800*22),
		'11.30am' => (946684800+1800*23),
		'12.00pm' => (946684800+1800*24),
		'12.30pm' => (946684800+1800*25),
		'1.00pm' => (946684800+1800*26),
		'1.30pm' => (946684800+1800*27),
		'2.00pm' => (946684800+1800*28),
		'2.30pm' => (946684800+1800*29),
		'3.00pm' => (946684800+1800*30),
		'3.30pm' => (946684800+1800*31),
		'4.00pm' => (946684800+1800*32),
		'4.30pm' => (946684800+1800*33),
		'5.00pm' => (946684800+1800*34),
		'5.30pm' => (946684800+1800*35),
		'6.00pm' => (946684800+1800*36),
		'6.30pm' => (946684800+1800*37),
		'7.00pm' => (946684800+1800*38),
		'7.30pm' => (946684800+1800*39),
		'8.00pm' => (946684800+1800*40),
		'8.30pm' => (946684800+1800*41),
		'9.00pm' => (946684800+1800*42),
		'9.30pm' => (946684800+1800*43),
		'10.00pm' => (946684800+1800*44),
		'10.30pm' => (946684800+1800*45),
		'11.00pm' => (946684800+1800*46),
		'11.30pm' => (946684800+1800*47)}
		@feed_duration = Feeding.first
		@email = Email.first
		@feed_time = FeedingTime.first

		@cron_feeding_times = []

		@feed_duration.feeding_duration = params[:feeding_duration]

		feed_file = File.open("../feed.py",'w')
		feed_file.puts 'import RPi.GPIO as GPIO'
		feed_file.puts 'import time'
		feed_file.puts 'import logging'
		feed_file.puts 'import datetime'
		feed_file.puts 'GPIO.setmode(GPIO.BCM)'
		feed_file.puts 'GPIO.setwarnings(False)'
		feed_file.puts 'GPIO.setup(23,GPIO.OUT)'
		feed_file.puts 'GPIO.setup(18,GPIO.OUT)'
		feed_file.puts 'GPIO.setup(26,GPIO.OUT)'
		feed_file.puts '#Power on motor'
		feed_file.puts 'GPIO.output(23,GPIO.HIGH)'
		feed_file.puts "time.sleep(#{params[:feeding_duration]})"
		feed_file.puts 'GPIO.output(23,GPIO.LOW)'
		feed_file.puts '# 3 Beeps'
		feed_file.puts 'GPIO.output(26,GPIO.HIGH)'
		feed_file.puts 'time.sleep(0.2)'
		feed_file.puts 'GPIO.output(26,GPIO.LOW)'
		feed_file.puts 'time.sleep(0.2)'
		feed_file.puts 'GPIO.output(26,GPIO.HIGH)'
		feed_file.puts 'time.sleep(0.2)'
		feed_file.puts 'GPIO.output(26,GPIO.LOW)'
		feed_file.puts 'time.sleep(0.2)'
		feed_file.puts 'GPIO.output(26,GPIO.HIGH)'
		feed_file.puts 'time.sleep(0.2)'
		feed_file.puts 'GPIO.output(26,GPIO.LOW)'
		feed_file.puts 'time.sleep(0.2)'
		feed_file.puts 'logging.basicConfig(filename="pitch_woofles/log/cron.log",level=logging.DEBUG)'
		feed_file.puts 'logging.debug(datetime.datetime.now())'
		feed_file.close

		@email.email1 = params[:email1]
		@email.email2 = params[:email2]

		params[:feeding_time_1] == 'None' ? (@feed_time.feeding_time_1 = nil) : (@feed_time.feeding_time_1 = Time.at(@time_conversion[params[:feeding_time_1]]))
		params[:feeding_time_2] == 'None' ? (@feed_time.feeding_time_2 = nil) : (@feed_time.feeding_time_2 = Time.at(@time_conversion[params[:feeding_time_2]]))
		params[:feeding_time_3] == 'None' ? (@feed_time.feeding_time_3 = nil) : (@feed_time.feeding_time_3 = Time.at(@time_conversion[params[:feeding_time_3]]))
		params[:feeding_time_4] == 'None' ? (@feed_time.feeding_time_4 = nil) : (@feed_time.feeding_time_4 = Time.at(@time_conversion[params[:feeding_time_4]]))
		

		if params[:feeding_time_1] != 'None'
			@cron_feeding_times.push(whenever_friendly!(params[:feeding_time_1]))
		end

		if params[:feeding_time_2] != 'None'
			@cron_feeding_times.push(whenever_friendly!(params[:feeding_time_2]))
		end

		if params[:feeding_time_3] != 'None'
			@cron_feeding_times.push(whenever_friendly!(params[:feeding_time_3]))
		end

		if params[:feeding_time_4] != 'None'
			@cron_feeding_times.push(whenever_friendly!(params[:feeding_time_4]))
		end

		out_file = File.open("config/schedule.rb",'w')
		out_file.puts 'set :output, "#{path}/log/cron.log"'
		out_file.puts ""
		out_file.puts "every 1.day, at: #{@cron_feeding_times} do"
		out_file.puts '  command "python #{path}/../feed.py"'
		out_file.puts '  command "date"'
		out_file.puts "end"
		out_file.close


		if @feed_time.save && @feed_duration.save && @email.save
			system('whenever --update-crontab')
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def destroy	
	end


	def feed_now
		if system("python ../feed_now.py #{params[:feeding_duration]}") 
			if (Feeding.first.notification == true)
				FeedingNotificationMailer.notify_owner(Email.first).deliver
			end
		  	puts "feeding success!"
		  	redirect_to root_path
		else
			puts "feeding failed"
		  	ErrorNotificationMailer.notify_owner(Email.first).deliver
		  	redirect_to root_path
		end
	end


	def feed 
		pyname = 'feed.py'
		if system("python", pyname) 
			if (Feeding.first.notification == true)
				FeedingNotificationMailer.notify_owner(Email.first).deliver
			end
		  	puts "feeding success!"
		else
			puts "feeding failed"
		  	ErrorNotificationMailer.notify_owner(Email.first).deliver
		end
	end



	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_feeding
	    @feeding = Feeding.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def feeding_params
	    params.require(:feeding, :email, :feeding_time).permit(:automated_feeding,:email1, :email2, :feeding_time_1, :feeding_time_2, :feeding_time_3, :feeding_time_4, :feeding_duration)
	  end

end

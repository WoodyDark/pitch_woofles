class FeedingsController < ApplicationController

	def index
		if signed_in? 
		else
			@time_selection = []
			redirect_to sign_in_path
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
		@feed_duration = Feeding.first
		@email = Email.first
		@feed_time = FeedingTime.first

		@feed_duration.feeding_duration = params[:feeding_duration]

		@email.email1 = params[:email1]
		@email.email2 = params[:email2]
		@email.email3 = params[:email3]
		@email.email4 = params[:email4]
		@email.email5 = params[:email5]

		@feed_time.feeding_time_1 = params[:feeding_time_1]
		@feed_time.feeding_time_2 = params[:feeding_time_2]
		@feed_time.feeding_time_3 = params[:feeding_time_3]
		@feed_time.feeding_time_4 = params[:feeding_time_4]


		if @feed_time.save && @feed_duration.save && @email.save
			%x(whenever --update-crontab)
			redirect_to root_path
		else
			redirect_to edit_feedings_path
		end
	end

	def destroy	
	end

	def feed 
		pyname = 'feed.py'
		if system("python", pyname) 
			if (Feeding.first.email_opt_out != true)
				FeedingNotification.notify_owner(Feeding.first)
			end
		  	puts "feeding success!"
		else
		  	ErrorNotification.notify_owner(Feeding.first)
		end
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_feeding
	    @feeding = Feeding.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def feeding_params
	    params.require(:feeding, :email, :feeding_time).permit(:email1, :email2, :email3, :email4, :email5, :feeding_time_1, :feeding_time_2, :feeding_time_3, :feeding_time_4, :feeding_duration)
	  end

end

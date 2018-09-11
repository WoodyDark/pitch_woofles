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
		@feeding = Feeding.first
		@feeding.email = params[:email]
		@feeding.feeding_time = params[:feeding_time]
		@feeding.feeding_duration = params[:feeding_duration]
		@feeding.email_opt_out = params[:email_opt_out]

		if @feeding.save
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
	    params.require(:feeding).permit(:email, :feeding_time, :feeding_duration, :email_opt_out)
	  end

end

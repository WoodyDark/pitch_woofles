set :output, "#{path}/log/cron.log"

every 1.day, at: ["10:00 am", "3:00 pm", "8:00 pm"] do
  command "python #{path}/../feed.py"
  command "date"
end
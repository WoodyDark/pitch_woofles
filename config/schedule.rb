set :output, "#{path}/log/cron.log"

every 1.day, at: ["12:00 am", "3:00 pm", "8:00 pm", "9:00 pm"] do
  command "python #{path}/../feed.py"
  command "date"
end

every :sunday, at: '12pm' do
  runner "Task.do_something_great"
end

set :output, "#{path}/log/cron.log"

every 1.day, at: ["9:00 am", "10:00 am", "11:00 am", "12:00 pm"] do
  command "python #{path}/../feed.py"
  command "echo 'Cron is running now!'"
end

every :sunday, at: '12pm' do
  runner "Task.do_something_great"
end

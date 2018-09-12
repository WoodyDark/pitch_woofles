set :output, "#{path}/log/cron.log"

every 1.day, at: ["7:00 am", "9:00 am", "11:00 am", "1:00 pm"] do
  command "python #{path}/../feed.py"
end

every :sunday, at: '12pm' do
  runner "Task.do_something_great"
end

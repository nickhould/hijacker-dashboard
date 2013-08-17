SCHEDULER.every '60s' do
  tasker = Tasker.new
  websites = tasker.websites
  send_event('websites', { items: websites })
end
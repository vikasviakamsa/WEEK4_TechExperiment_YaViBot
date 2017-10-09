require 'facebook/messenger'
include Facebook::Messenger
# NOTE: ENV variables should be set directly in terminal for testing on localhost

# Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])


Facebook::Messenger::Thread.set({
      setting_type: 'call_to_actions',
      thread_state: 'existing_thread',
      call_to_actions: [
        {
          type: 'postback',
          title: 'Coordinates lookup',
          payload: 'COORDINATES'
        },
        {
          type: 'postback',
          title: 'Postal address lookup',
          payload: 'FULL_ADDRESS'
        },
        {
          type: 'postback',
          title: 'Location lookup',
          payload: 'LOCATION'
        }
      ]
    }, access_token: ENV['ACCESS_TOKEN'])


Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}" # debug purposes
  message.reply(text: 'Hello!')
end

require 'facebook/messenger'
include Facebook::Messenger

Bot.on :message do |message|
  message.reply(text: 'Hello!')
end

Bot.deliver({
  recipient: {
    id: '45123'
  },
  message: {
    text: 'Human?'
  }
}, access_token: ENV['ACCESS_TOKEN'])





# NOTE: ENV variables should be set directly in terminal for testing on localhost

# Subcribe bot to your page
#Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
#
#Bot.on :message do |message|
#  puts "Received '#{message.inspect}' from #{message.sender}" # debug purposes
#  message.reply(text: 'Hello!')
#end



#Bot.on :postback do |postback|
#  if postback.title == 'No'
#    puts "you are marked for extermination!"
#  end
#end
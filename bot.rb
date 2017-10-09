require 'facebook/messenger'
include Facebook::Messenger
# NOTE: ENV variables should be set directly in terminal for testing on localhost

# Subcribe bot to your page

#Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
#
#Bot.on :message do |message|
#  puts "Received '#{message.inspect}' from #{message.sender}" # debug purposes
#  message.reply(text: 'Hello!')
#end






Bot.on :message do |message|

message.reply(
  attachment: {
    type: 'template',
    payload: {
      template_type: 'button',
      text: 'Human, do you like me?',
      buttons: [
        { type: 'postback', title: 'Yes', payload: 'HARMLESS' },
        { type: 'postback', title: 'No', payload: 'EXTERMINATE' }
      ]
    }
  }
)
end

Bot.on :postback do |postback|
  if postback.title == 'No'
    puts "you are marked for extermination!"
  end
end
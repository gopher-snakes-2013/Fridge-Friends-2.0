require 'rubygems'
require 'twilio-ruby'

account_sid = 'ACf895d88962485e9831abd44f013c09f0'
auth_token = '6be73c40c5926faadd2eb899e8b41653'
@client = Twilio::REST::Client.new account_sid, auth_token

p @client

message = @client.account.sms.messages.create(body: 'HIIIIIII STEVEN!!!!!!!!!!',
                                              to: '+13605844437',
                                              from: '!14153602257')
message.sid
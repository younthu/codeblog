#!/usr/bin/env ruby

print "What is the URL of your Apple Downloads resource?\nURL:"
# url = gets.strip
url = 'https://download.developer.apple.com/Developer_Tools/Xcode_12.4/Xcode_12.4.xip'

print "What is the ADCDownloadAuth cookie token:\nADCDownloadAuth: "
# token = gets.strip
token = 'ZpEHz%2FxiasbTGCir9hQhaAOv7yDMkU1RMHxeM1QtxXnj4z8qz9qoqGbZGI%2FYPF71HySnOOuxS0ZQ%0D%0AbmSIl31Yf8EDtMBLYHk%2BvuiuGF2%2FAIHaTKXLW1f5aNEygTjxVg%2FW5wkVIf6OE9ctPFexgvNnFUQ2%0D%0ARmrppVNUDqnqlqzifz6pi4QN%0D%0A'

command = "aria2c --header \"Host: adcdownload.apple.com\" --header \"Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\" --header \"Upgrade-Insecure-Requests: 1\" --header \"Cookie: ADCDownloadAuth=#{token}\" --header \"User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 10_1 like Mac OS X) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0 Mobile/14B72 Safari/602.1\" --header \"Accept-Language: en-us\" -x 16 -s 16 #{url} -d ~/Downloads"

exec(command)

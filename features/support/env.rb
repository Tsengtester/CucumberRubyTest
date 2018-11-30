require 'rubygems'
require 'rspec/expectations'
require 'selenium-cucumber'
#require 'test/unit'

class AppiumWorld
end

#case $platform = ENV['PLATFORM']     
# If platform is android or ios create driver instance for mobile browser
#when $platform == 'android'
caps = Appium.load_appium_txt file: File.expand_path("../android_cap.txt", __FILE__), verbose: true
#end

# Create a custom World class so we don't pollute `Object` with Appium methods

Appium::Driver.new(caps, true)
Appium.promote_appium_methods AppiumWorld

World do
    AppiumWorld.new
end


Before { $driver.start_driver }
After { $driver.driver_quit }


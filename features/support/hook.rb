Before("@first") do  
    #$driver.start_driver

    wait = Selenium::WebDriver::Wait.new :timeout => 10
    wait.until { $driver.find_element(:id, "action_bar_root").displayed? }
end

After("@last") do
    #$driver.remove_app('com.isuncloud.pingpaywallet')
    #$driver.driver_quit
end
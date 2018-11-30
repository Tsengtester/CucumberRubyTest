When /我確認是否勾選/ do
    Check= $driver.find_element(:id, "checkBox").attribute("checked")
    expect(Check).to eq ('false')
end

Then /我驗證欄位狀態 "(.*?)"/ do |value|
    CreateWalletcheck= $driver.find_element(:id, "createWalletText").attribute("enabled")
    ImportWalletcheck= $driver.find_element(:id, "importWalletText").attribute("enabled")
    expect(CreateWalletcheck).to eq (value)
    expect(ImportWalletcheck).to eq (value)

end

Given /我勾選/ do
    $driver.find_element(:id, "checkBox").click
    CreateWalletcheck= $driver.find_element(:id, "createWalletText").attribute("enabled")
    ImportWalletcheck= $driver.find_element(:id, "importWalletText").attribute("enabled")
    expect(CreateWalletcheck).to eq('true')
    expect(ImportWalletcheck).to eq('true')
end

When /使用者點選恢復錢包/ do
    $driver.find_element(:id, "importWalletText").click
end

Given /^Retrieve By Mnemonic$/ do
    $driver.find_element(:id, "mnemonicButton").click
end

When /使用者輸入 "(.*?)" "(.*?)" "(.*?)"/ do |a,b,c|
    $driver.find_element(:uiautomator, 'new UiSelector().className("android.widget.EditText").instance(0)').send_keys("#{a}")
    $driver.find_element(:uiautomator, 'new UiSelector().className("android.widget.EditText").instance(1)').send_keys("#{b}")
    $driver.find_element(:uiautomator, 'new UiSelector().className("android.widget.EditText").instance(2)').send_keys("#{c}")
    #$driver.find_element(:class, "android.widget.EditText")[1].send_keys("aaa")
end

Then /確認按鍵狀態 "(.*?)" 和訊息 "(.*?)"/ do |d,e|
    ConfirmBtnStatus = $driver.find_element(:id, "confirmText").attribute("enabled")
    puts ConfirmBtnStatus
    expect(ConfirmBtnStatus).to eq("#{d}")
    if "#{d}"=="true"
       $driver.find_element(:id, "confirmText").click
       sleep (2)
       ToastMag= $driver.find_element(:xpath,"//android.widget.Toast[1]").attribute("name")
       puts ToastMag
       expect(ToastMag).to eq("#{e}")
    end
end








Then(/^the element having (.+) "([^\"]*)" should\s*((?:not)?)\s+have text as "(.*?)"$/) do |type, access_name, present, value |
    #data="title"
    #puts data
    #access_name = $element_table[access_name]
    validate_locator type
    check_element_text(type, value, access_name, present.empty?)
end

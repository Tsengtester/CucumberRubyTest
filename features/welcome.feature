#language: zh-TW

功能: 隱私權與服務條款

    場景: 是否勾選，影響使用者是否可創建錢包或恢復錢包
      當我確認是否勾選
      那麼我驗證欄位狀態 "false"
@first
    場景: 勾選，使用者可進行創建錢包跟恢復錢包
      假設我勾選
      而且我驗證欄位狀態 "true"
      當使用者點選恢復錢包
      那麼the element having id "titleText" should have text as "恢復公鏈錢包"

@last
    場景大綱: 恢復公鏈錢包_助記詞檢核
      假設我勾選
      而且使用者點選恢復錢包
      而且Retrieve By Mnemonic
      那麼the element having id "toolbarTitle" should have text as "輸入助記詞"
      當使用者輸入 "<Mnemonic>" "<Password_1>" "<Password_2>"
      那麼確認按鍵狀態 "<Btnstatus>" 和訊息 "<Msg>"
    @Mnemonic
      例子:
      | Mnemonic | Password_1 | Password_2 | Btnstatus | Msg | Notes |
      |          | Ping123Pay | Ping123Pay | false     |     | Mnemonic check 1 |
      | aaa      | Ping123Pay | Ping123Pay | true      | 助記詞輸入有誤，請重新檢查 | Mnemonic check 2 |
      | camp spike help need alcohol silk divert ready chat february nuclear trigge| Ping123Pay | Ping123Pay | true | 助記詞輸入有誤，請重新檢查 | Mnemonic check 3 |
      | camp spike help need alcohol silk divert ready chat   february nuclear trigger| Ping123Pay | Ping123Pay | true | 助記詞輸入有誤，請重新檢查 | Mnemonic check 4 |
    
    @Password
      例子:
      | Mnemonic | Password_1 | Password_2 | Btnstatus | Msg | Notes |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger|           | Ping123Pay | false|                        | Password check 1 |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger| Ping12P   | Ping12P    | true | 密碼長度應介於 8-20 字元   | Password check 2 |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger| Ping123PayPing123Pay1 | Ping123PayPing123Pay1 | true | 密碼長度應介於 8-20 字元 | Password check 3 |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger| 12345678  | 12345678   | true | 需包含各一個數字與字母     | Password check 4 |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger| abcdefgh  | abcdefgh   | true | 需包含各一個數字與字母     | Password check 5 |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger| ABCDEFGH  | ABCDEFGH   | true | 需包含各一個數字與字母     | Password check 6 |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger| []{}#%^*+= | []{}#%^*+= | true | 需包含各一個數字與字母     | Password check 7 |
    
    @RepeatPassword
      例子:
      | Mnemonic | Password_1 | Password_2 | Btnstatus | Msg | Notes |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger| Ping123Pay |            | false |      | RepeatPassword check 1 |
      | camp spike help need alcohol silk divert ready chat february nuclear trigger| Ping123Pay[]{}#% | Ping123Pay[] | true | 密碼不相符，請重新確認 | RepeatPassword check 2 |
    



     

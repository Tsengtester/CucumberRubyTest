# CucumberRubyTest
2018.11.30

-檢核方式expect用法確認

-確認繁體中文語系用法
1.#language: zh-TW前面加上
2.關鍵字對應 
Feature: => 功能:
Scenario Outline: => 場景大綱:
Examples: => 例子:

-確認DataTable使用
1.一定要用Scenario Outline，不是Scenario
2.Steps丟入參數寫法

-多tags執行
cucumber -p android --tags '@last and @RepeatPassword'

-元件抓不到問題
1.APP輸入欄位沒定義ID，從xpath改用uiautomator方式(之後要確認元件庫要如何設定)
2.抓取Android原生Ｍsg:find_element(:xpath,"//android.widget.Toast[1]").attribute("name")



已知問題：
1.目前每次都會重開APP，不知道能不能整個直接跑完 (確認driver.start跟結束時間)
2.Ruby常數重複給值warning
3.之後實際改用elements_table

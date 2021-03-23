# eclipseYachi
商城專案建立初始資料步驟
1. 先匯入空白的sql檔案(yachEmpty.sql)
   (僅有產品、產品種類、訂單狀態、配送方式、付款方式) 有值
2. 執行
	1. _00_util\init\initOrderRandomNumber.java 建立訂單編號
	2. _00_util\init\EDMTableResetHibernate.java 匯入產品圖片

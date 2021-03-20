package _20_shoppingMall._23_orderProcess.mail;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import _02_model.entity.OrderBean;


public class SendingOrderSuccessEmail {

	
	private String mEmail;
	private OrderBean orderBean;



	public SendingOrderSuccessEmail(String mEmail, OrderBean orderBean) {
		super();
		this.mEmail = mEmail;
		this.orderBean = orderBean;
	}



	public void sendAcceptMail() {
		// Enter the email address and password for the account from which verification link will be send
//		String email = "trainme015@gmail.com";
//		String password = "Trainme0!";
//		String email = "spotstour015@gmail.com";
//		String password = "Spotstour0!";
		String email = "yachijava015@gmail.com";
		String password = "Do!ng123";
		
//		int starCourseTime=course.getTime();
//		int endCourseTime=course.getTime()+1;
//		
		Properties theProperties = new Properties();
		
		theProperties.put("mail.smtp.auth", "true");
		theProperties.put("mail.smtp.starttls.enable", "true");
		theProperties.put("mail.smtp.host", "smtp.gmail.com");
		theProperties.put("mail.smtp.port", "587");
		
		Session session = Session.getDefaultInstance(theProperties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});
		
		try {
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mEmail));
			// 設定信件標題
			message.setSubject("*Yachi 訂單成功通知信!");
			
//			Timestamp ts = orderBean.getOrder_datetime();
			Date orderDate = orderBean.getOrder_datetime(); //util.Date
			Date shipDate =	orderBean.getShipping_date();
//			Date date = new Date();
			SimpleDateFormat sdfMin = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String orderTime = sdfMin.format(orderDate.getTime()); //訂購時間
			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
			String shipTime = sdfDate.format(shipDate.getTime()); //配送時間
//			try {
//				date = ts;
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			
			// 設定信件內容
//			message.setText("Click this link to confirm your email address and complete setup for your account."
//					+ "\n\nVerification Link: " + "http://localhost:8082/TrainMe/ActivateAccount?key=" + type + "&key1=" + userEmail + "&key2=" + myHash);
			String messageStr = "\r\n"
					+ "<!doctype html>\r\n"
					+ "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n"
					+ "    <head>\r\n"
					+ "        <!-- NAME: SIMPLE TEXT -->\r\n"
					+ "        <!--[if gte mso 15]>\r\n"
					+ "        <xml>\r\n"
					+ "            <o:OfficeDocumentSettings>\r\n"
					+ "            <o:AllowPNG/>\r\n"
					+ "            <o:PixelsPerInch>96</o:PixelsPerInch>\r\n"
					+ "            </o:OfficeDocumentSettings>\r\n"
					+ "        </xml>\r\n"
					+ "        <![endif]-->\r\n"
					+ "        <meta charset=\"UTF-8\">\r\n"
					+ "        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
					+ "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n"
					+ "        <title>*|MC:SUBJECT|*</title>\r\n"
					+ "        \r\n"
					+ "    <style type=\"text/css\">\r\n"
					+ "		p{\r\n"
					+ "			margin:10px 0;\r\n"
					+ "			padding:0;\r\n"
					+ "		}\r\n"
					+ "		table{\r\n"
					+ "			border-collapse:collapse;\r\n"
					+ "		}\r\n"
					+ "		h1,h2,h3,h4,h5,h6{\r\n"
					+ "			display:block;\r\n"
					+ "			margin:0;\r\n"
					+ "			padding:0;\r\n"
					+ "		}\r\n"
					+ "		img,a img{\r\n"
					+ "			border:0;\r\n"
					+ "			height:auto;\r\n"
					+ "			outline:none;\r\n"
					+ "			text-decoration:none;\r\n"
					+ "		}\r\n"
					+ "		body,#bodyTable,#bodyCell{\r\n"
					+ "			height:100%;\r\n"
					+ "			margin:0;\r\n"
					+ "			padding:0;\r\n"
					+ "			width:100%;\r\n"
					+ "		}\r\n"
					+ "		.mcnPreviewText{\r\n"
					+ "			display:none !important;\r\n"
					+ "		}\r\n"
					+ "		#outlook a{\r\n"
					+ "			padding:0;\r\n"
					+ "		}\r\n"
					+ "		img{\r\n"
					+ "			-ms-interpolation-mode:bicubic;\r\n"
					+ "		}\r\n"
					+ "		table{\r\n"
					+ "			mso-table-lspace:0pt;\r\n"
					+ "			mso-table-rspace:0pt;\r\n"
					+ "		}\r\n"
					+ "		.ReadMsgBody{\r\n"
					+ "			width:100%;\r\n"
					+ "		}\r\n"
					+ "		.ExternalClass{\r\n"
					+ "			width:100%;\r\n"
					+ "		}\r\n"
					+ "		p,a,li,td,blockquote{\r\n"
					+ "			mso-line-height-rule:exactly;\r\n"
					+ "		}\r\n"
					+ "		a[href^=tel],a[href^=sms]{\r\n"
					+ "			color:inherit;\r\n"
					+ "			cursor:default;\r\n"
					+ "			text-decoration:none;\r\n"
					+ "		}\r\n"
					+ "		p,a,li,td,body,table,blockquote{\r\n"
					+ "			-ms-text-size-adjust:100%;\r\n"
					+ "			-webkit-text-size-adjust:100%;\r\n"
					+ "		}\r\n"
					+ "		.ExternalClass,.ExternalClass p,.ExternalClass td,.ExternalClass div,.ExternalClass span,.ExternalClass font{\r\n"
					+ "			line-height:100%;\r\n"
					+ "		}\r\n"
					+ "		a[x-apple-data-detectors]{\r\n"
					+ "			color:inherit !important;\r\n"
					+ "			text-decoration:none !important;\r\n"
					+ "			font-size:inherit !important;\r\n"
					+ "			font-family:inherit !important;\r\n"
					+ "			font-weight:inherit !important;\r\n"
					+ "			line-height:inherit !important;\r\n"
					+ "		}\r\n"
					+ "		#bodyCell{\r\n"
					+ "			padding:10px;\r\n"
					+ "		}\r\n"
					+ "		.templateContainer{\r\n"
					+ "			max-width:600px !important;\r\n"
					+ "		}\r\n"
					+ "		a.mcnButton{\r\n"
					+ "			display:block;\r\n"
					+ "		}\r\n"
					+ "		.mcnImage,.mcnRetinaImage{\r\n"
					+ "			vertical-align:bottom;\r\n"
					+ "		}\r\n"
					+ "		.mcnTextContent{\r\n"
					+ "			word-break:break-word;\r\n"
					+ "		}\r\n"
					+ "		.mcnTextContent img{\r\n"
					+ "			height:auto !important;\r\n"
					+ "		}\r\n"
					+ "		.mcnDividerBlock{\r\n"
					+ "			table-layout:fixed !important;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Page\r\n"
					+ "	@section Background Style\r\n"
					+ "	@tip Set the background color and top border for your email. You may want to choose colors that match your company's branding.\r\n"
					+ "	*/\r\n"
					+ "		body,#bodyTable{\r\n"
					+ "			/*@editable*/background-color:#FFFFFF;\r\n"
					+ "			/*@editable*/background-image:none;\r\n"
					+ "			/*@editable*/background-repeat:no-repeat;\r\n"
					+ "			/*@editable*/background-position:center;\r\n"
					+ "			/*@editable*/background-size:cover;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Page\r\n"
					+ "	@section Background Style\r\n"
					+ "	@tip Set the background color and top border for your email. You may want to choose colors that match your company's branding.\r\n"
					+ "	*/\r\n"
					+ "		#bodyCell{\r\n"
					+ "			/*@editable*/border-top:0;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Page\r\n"
					+ "	@section Email Border\r\n"
					+ "	@tip Set the border for your email.\r\n"
					+ "	*/\r\n"
					+ "		.templateContainer{\r\n"
					+ "			/*@editable*/border:0;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Page\r\n"
					+ "	@section Heading 1\r\n"
					+ "	@tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.\r\n"
					+ "	@style heading 1\r\n"
					+ "	*/\r\n"
					+ "		h1{\r\n"
					+ "			/*@editable*/color:#202020;\r\n"
					+ "			/*@editable*/font-family:Helvetica;\r\n"
					+ "			/*@editable*/font-size:26px;\r\n"
					+ "			/*@editable*/font-style:normal;\r\n"
					+ "			/*@editable*/font-weight:bold;\r\n"
					+ "			/*@editable*/line-height:125%;\r\n"
					+ "			/*@editable*/letter-spacing:normal;\r\n"
					+ "			/*@editable*/text-align:left;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Page\r\n"
					+ "	@section Heading 2\r\n"
					+ "	@tip Set the styling for all second-level headings in your emails.\r\n"
					+ "	@style heading 2\r\n"
					+ "	*/\r\n"
					+ "		h2{\r\n"
					+ "			/*@editable*/color:#202020;\r\n"
					+ "			/*@editable*/font-family:Helvetica;\r\n"
					+ "			/*@editable*/font-size:22px;\r\n"
					+ "			/*@editable*/font-style:normal;\r\n"
					+ "			/*@editable*/font-weight:bold;\r\n"
					+ "			/*@editable*/line-height:125%;\r\n"
					+ "			/*@editable*/letter-spacing:normal;\r\n"
					+ "			/*@editable*/text-align:left;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Page\r\n"
					+ "	@section Heading 3\r\n"
					+ "	@tip Set the styling for all third-level headings in your emails.\r\n"
					+ "	@style heading 3\r\n"
					+ "	*/\r\n"
					+ "		h3{\r\n"
					+ "			/*@editable*/color:#202020;\r\n"
					+ "			/*@editable*/font-family:Helvetica;\r\n"
					+ "			/*@editable*/font-size:20px;\r\n"
					+ "			/*@editable*/font-style:normal;\r\n"
					+ "			/*@editable*/font-weight:bold;\r\n"
					+ "			/*@editable*/line-height:125%;\r\n"
					+ "			/*@editable*/letter-spacing:normal;\r\n"
					+ "			/*@editable*/text-align:left;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Page\r\n"
					+ "	@section Heading 4\r\n"
					+ "	@tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.\r\n"
					+ "	@style heading 4\r\n"
					+ "	*/\r\n"
					+ "		h4{\r\n"
					+ "			/*@editable*/color:#202020;\r\n"
					+ "			/*@editable*/font-family:Helvetica;\r\n"
					+ "			/*@editable*/font-size:18px;\r\n"
					+ "			/*@editable*/font-style:normal;\r\n"
					+ "			/*@editable*/font-weight:bold;\r\n"
					+ "			/*@editable*/line-height:125%;\r\n"
					+ "			/*@editable*/letter-spacing:normal;\r\n"
					+ "			/*@editable*/text-align:left;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Header\r\n"
					+ "	@section Header Style\r\n"
					+ "	@tip Set the borders for your email's header area.\r\n"
					+ "	*/\r\n"
					+ "		#templateHeader{\r\n"
					+ "			/*@editable*/border-top:0;\r\n"
					+ "			/*@editable*/border-bottom:0;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Header\r\n"
					+ "	@section Header Text\r\n"
					+ "	@tip Set the styling for your email's header text. Choose a size and color that is easy to read.\r\n"
					+ "	*/\r\n"
					+ "		#templateHeader .mcnTextContent,#templateHeader .mcnTextContent p{\r\n"
					+ "			/*@editable*/color:#202020;\r\n"
					+ "			/*@editable*/font-family:Helvetica;\r\n"
					+ "			/*@editable*/font-size:16px;\r\n"
					+ "			/*@editable*/line-height:150%;\r\n"
					+ "			/*@editable*/text-align:left;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Header\r\n"
					+ "	@section Header Link\r\n"
					+ "	@tip Set the styling for your email's header links. Choose a color that helps them stand out from your text.\r\n"
					+ "	*/\r\n"
					+ "		#templateHeader .mcnTextContent a,#templateHeader .mcnTextContent p a{\r\n"
					+ "			/*@editable*/color:#007C89;\r\n"
					+ "			/*@editable*/font-weight:normal;\r\n"
					+ "			/*@editable*/text-decoration:underline;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Body\r\n"
					+ "	@section Body Style\r\n"
					+ "	@tip Set the borders for your email's body area.\r\n"
					+ "	*/\r\n"
					+ "		#templateBody{\r\n"
					+ "			/*@editable*/border-top:0;\r\n"
					+ "			/*@editable*/border-bottom:0;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Body\r\n"
					+ "	@section Body Text\r\n"
					+ "	@tip Set the styling for your email's body text. Choose a size and color that is easy to read.\r\n"
					+ "	*/\r\n"
					+ "		#templateBody .mcnTextContent,#templateBody .mcnTextContent p{\r\n"
					+ "			/*@editable*/color:#202020;\r\n"
					+ "			/*@editable*/font-family:Helvetica;\r\n"
					+ "			/*@editable*/font-size:16px;\r\n"
					+ "			/*@editable*/line-height:150%;\r\n"
					+ "			/*@editable*/text-align:left;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Body\r\n"
					+ "	@section Body Link\r\n"
					+ "	@tip Set the styling for your email's body links. Choose a color that helps them stand out from your text.\r\n"
					+ "	*/\r\n"
					+ "		#templateBody .mcnTextContent a,#templateBody .mcnTextContent p a{\r\n"
					+ "			/*@editable*/color:#007C89;\r\n"
					+ "			/*@editable*/font-weight:normal;\r\n"
					+ "			/*@editable*/text-decoration:underline;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Footer\r\n"
					+ "	@section Footer Style\r\n"
					+ "	@tip Set the borders for your email's footer area.\r\n"
					+ "	*/\r\n"
					+ "		#templateFooter{\r\n"
					+ "			/*@editable*/border-top:0;\r\n"
					+ "			/*@editable*/border-bottom:0;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Footer\r\n"
					+ "	@section Footer Text\r\n"
					+ "	@tip Set the styling for your email's footer text. Choose a size and color that is easy to read.\r\n"
					+ "	*/\r\n"
					+ "		#templateFooter .mcnTextContent,#templateFooter .mcnTextContent p{\r\n"
					+ "			/*@editable*/color:#202020;\r\n"
					+ "			/*@editable*/font-family:Helvetica;\r\n"
					+ "			/*@editable*/font-size:12px;\r\n"
					+ "			/*@editable*/line-height:150%;\r\n"
					+ "			/*@editable*/text-align:left;\r\n"
					+ "		}\r\n"
					+ "	/*\r\n"
					+ "	@tab Footer\r\n"
					+ "	@section Footer Link\r\n"
					+ "	@tip Set the styling for your email's footer links. Choose a color that helps them stand out from your text.\r\n"
					+ "	*/\r\n"
					+ "		#templateFooter .mcnTextContent a,#templateFooter .mcnTextContent p a{\r\n"
					+ "			/*@editable*/color:#202020;\r\n"
					+ "			/*@editable*/font-weight:normal;\r\n"
					+ "			/*@editable*/text-decoration:underline;\r\n"
					+ "		}\r\n"
					+ "	@media only screen and (min-width:768px){\r\n"
					+ "		.templateContainer{\r\n"
					+ "			width:600px !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		body,table,td,p,a,li,blockquote{\r\n"
					+ "			-webkit-text-size-adjust:none !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		body{\r\n"
					+ "			width:100% !important;\r\n"
					+ "			min-width:100% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnRetinaImage{\r\n"
					+ "			max-width:100% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnImage{\r\n"
					+ "			width:100% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnCartContainer,.mcnCaptionTopContent,.mcnRecContentContainer,.mcnCaptionBottomContent,.mcnTextContentContainer,.mcnBoxedTextContentContainer,.mcnImageGroupContentContainer,.mcnCaptionLeftTextContentContainer,.mcnCaptionRightTextContentContainer,.mcnCaptionLeftImageContentContainer,.mcnCaptionRightImageContentContainer,.mcnImageCardLeftTextContentContainer,.mcnImageCardRightTextContentContainer,.mcnImageCardLeftImageContentContainer,.mcnImageCardRightImageContentContainer{\r\n"
					+ "			max-width:100% !important;\r\n"
					+ "			width:100% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnBoxedTextContentContainer{\r\n"
					+ "			min-width:100% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnImageGroupContent{\r\n"
					+ "			padding:9px !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnCaptionLeftContentOuter .mcnTextContent,.mcnCaptionRightContentOuter .mcnTextContent{\r\n"
					+ "			padding-top:9px !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnImageCardTopImageContent,.mcnCaptionBottomContent:last-child .mcnCaptionBottomImageContent,.mcnCaptionBlockInner .mcnCaptionTopContent:last-child .mcnTextContent{\r\n"
					+ "			padding-top:18px !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnImageCardBottomImageContent{\r\n"
					+ "			padding-bottom:9px !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnImageGroupBlockInner{\r\n"
					+ "			padding-top:0 !important;\r\n"
					+ "			padding-bottom:0 !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnImageGroupBlockOuter{\r\n"
					+ "			padding-top:9px !important;\r\n"
					+ "			padding-bottom:9px !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnTextContent,.mcnBoxedTextContentColumn{\r\n"
					+ "			padding-right:18px !important;\r\n"
					+ "			padding-left:18px !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcnImageCardLeftImageContent,.mcnImageCardRightImageContent{\r\n"
					+ "			padding-right:18px !important;\r\n"
					+ "			padding-bottom:0 !important;\r\n"
					+ "			padding-left:18px !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "		.mcpreview-image-uploader{\r\n"
					+ "			display:none !important;\r\n"
					+ "			width:100% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "	/*\r\n"
					+ "	@tab Mobile Styles\r\n"
					+ "	@section Heading 1\r\n"
					+ "	@tip Make the first-level headings larger in size for better readability on small screens.\r\n"
					+ "	*/\r\n"
					+ "		h1{\r\n"
					+ "			/*@editable*/font-size:22px !important;\r\n"
					+ "			/*@editable*/line-height:125% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "	/*\r\n"
					+ "	@tab Mobile Styles\r\n"
					+ "	@section Heading 2\r\n"
					+ "	@tip Make the second-level headings larger in size for better readability on small screens.\r\n"
					+ "	*/\r\n"
					+ "		h2{\r\n"
					+ "			/*@editable*/font-size:20px !important;\r\n"
					+ "			/*@editable*/line-height:125% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "	/*\r\n"
					+ "	@tab Mobile Styles\r\n"
					+ "	@section Heading 3\r\n"
					+ "	@tip Make the third-level headings larger in size for better readability on small screens.\r\n"
					+ "	*/\r\n"
					+ "		h3{\r\n"
					+ "			/*@editable*/font-size:18px !important;\r\n"
					+ "			/*@editable*/line-height:125% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "	/*\r\n"
					+ "	@tab Mobile Styles\r\n"
					+ "	@section Heading 4\r\n"
					+ "	@tip Make the fourth-level headings larger in size for better readability on small screens.\r\n"
					+ "	*/\r\n"
					+ "		h4{\r\n"
					+ "			/*@editable*/font-size:16px !important;\r\n"
					+ "			/*@editable*/line-height:150% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "	/*\r\n"
					+ "	@tab Mobile Styles\r\n"
					+ "	@section Boxed Text\r\n"
					+ "	@tip Make the boxed text larger in size for better readability on small screens. We recommend a font size of at least 16px.\r\n"
					+ "	*/\r\n"
					+ "		table.mcnBoxedTextContentContainer td.mcnTextContent,td.mcnBoxedTextContentContainer td.mcnTextContent p{\r\n"
					+ "			/*@editable*/font-size:14px !important;\r\n"
					+ "			/*@editable*/line-height:150% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "	/*\r\n"
					+ "	@tab Mobile Styles\r\n"
					+ "	@section Header Text\r\n"
					+ "	@tip Make the header text larger in size for better readability on small screens.\r\n"
					+ "	*/\r\n"
					+ "		td#templateHeader td.mcnTextContent,td#templateHeader td.mcnTextContent p{\r\n"
					+ "			/*@editable*/font-size:16px !important;\r\n"
					+ "			/*@editable*/line-height:150% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "	/*\r\n"
					+ "	@tab Mobile Styles\r\n"
					+ "	@section Body Text\r\n"
					+ "	@tip Make the body text larger in size for better readability on small screens. We recommend a font size of at least 16px.\r\n"
					+ "	*/\r\n"
					+ "		td#templateBody td.mcnTextContent,td#templateBody td.mcnTextContent p{\r\n"
					+ "			/*@editable*/font-size:16px !important;\r\n"
					+ "			/*@editable*/line-height:150% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}	@media only screen and (max-width: 480px){\r\n"
					+ "	/*\r\n"
					+ "	@tab Mobile Styles\r\n"
					+ "	@section Footer Text\r\n"
					+ "	@tip Make the footer content text larger in size for better readability on small screens.\r\n"
					+ "	*/\r\n"
					+ "		td#templateFooter td.mcnTextContent,td#templateFooter td.mcnTextContent p{\r\n"
					+ "			/*@editable*/font-size:14px !important;\r\n"
					+ "			/*@editable*/line-height:150% !important;\r\n"
					+ "		}\r\n"
					+ "\r\n"
					+ "}</style></head>\r\n"
					+ "    <body>\r\n"
					+ "        \r\n"
					+ "        <!--[if !gte mso 9]><!----><span class=\"mcnPreviewText\" style=\"display:none; font-size:0px; line-height:0px; max-height:0px; max-width:0px; opacity:0; overflow:hidden; visibility:hidden; mso-hide:all;\">*|MC_PREVIEW_TEXT|*</span><!--<![endif]-->\r\n"
					+ "        <!--*|END:IF|*-->\r\n"
					+ "        <center>\r\n"
					+ "            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"bodyTable\">\r\n"
					+ "                <tr>\r\n"
					+ "                    <td align=\"left\" valign=\"top\" id=\"bodyCell\">\r\n"
					+ "                        <!-- BEGIN TEMPLATE // -->\r\n"
					+ "                        <!--[if (gte mso 9)|(IE)]>\r\n"
					+ "                        <table align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" style=\"width:600px;\">\r\n"
					+ "                        <tr>\r\n"
					+ "                        <td align=\"center\" valign=\"top\" width=\"600\" style=\"width:600px;\">\r\n"
					+ "                        <![endif]-->\r\n"
					+ "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"templateContainer\">\r\n"
					+ "                            <tr>\r\n"
					+ "                                <td valign=\"top\" id=\"templateHeader\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnTextBlock\" style=\"min-width:100%;\">\r\n"
					+ "    <tbody class=\"mcnTextBlockOuter\">\r\n"
					+ "        <tr>\r\n"
					+ "            <td valign=\"top\" class=\"mcnTextBlockInner\" style=\"padding-top:9px;\">\r\n"
					+ "              	<!--[if mso]>\r\n"
					+ "				<table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"width:100%;\">\r\n"
					+ "				<tr>\r\n"
					+ "				<![endif]-->\r\n"
					+ "			    \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				<td valign=\"top\" width=\"600\" style=\"width:600px;\">\r\n"
					+ "				<![endif]-->\r\n"
					+ "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%; min-width:100%;\" width=\"100%\" class=\"mcnTextContentContainer\">\r\n"
					+ "                    <tbody><tr>\r\n"
					+ "                        \r\n"
					+ "                        <td valign=\"top\" class=\"mcnTextContent\" style=\"padding-top:0; padding-right:18px; padding-bottom:9px; padding-left:18px;\">\r\n"
					+ "                        \r\n"
					+ "                            <span style=\"font-family:arial,helvetica neue,helvetica,sans-serif\"><span style=\"font-size:38px\">恭喜您完成Yachi商城的訂購</span></span>\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                </tbody></table>\r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</td>\r\n"
					+ "				<![endif]-->\r\n"
					+ "                \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</tr>\r\n"
					+ "				</table>\r\n"
					+ "				<![endif]-->\r\n"
					+ "            </td>\r\n"
					+ "        </tr>\r\n"
					+ "    </tbody>\r\n"
					+ "</table></td>\r\n"
					+ "                            </tr>\r\n"
					+ "                            <tr>\r\n"
					+ "                                <td valign=\"top\" id=\"templateBody\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnTextBlock\" style=\"min-width:100%;\">\r\n"
					+ "    <tbody class=\"mcnTextBlockOuter\">\r\n"
					+ "        <tr>\r\n"
					+ "            <td valign=\"top\" class=\"mcnTextBlockInner\" style=\"padding-top:9px;\">\r\n"
					+ "              	<!--[if mso]>\r\n"
					+ "				<table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"width:100%;\">\r\n"
					+ "				<tr>\r\n"
					+ "				<![endif]-->\r\n"
					+ "			    \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				<td valign=\"top\" width=\"600\" style=\"width:600px;\">\r\n"
					+ "				<![endif]-->\r\n"
					+ "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%; min-width:100%;\" width=\"100%\" class=\"mcnTextContentContainer\">\r\n"
					+ "                    <tbody><tr>\r\n"
					+ "                        \r\n"
					+ "                        <td valign=\"top\" class=\"mcnTextContent\" style=\"padding-top:0; padding-right:18px; padding-bottom:9px; padding-left:18px;\">\r\n"
					+ "                        \r\n"
					+ "                            **此信件由系統自動產生與發送，請勿直接回覆**\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                </tbody></table>\r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</td>\r\n"
					+ "				<![endif]-->\r\n"
					+ "                \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</tr>\r\n"
					+ "				</table>\r\n"
					+ "				<![endif]-->\r\n"
					+ "            </td>\r\n"
					+ "        </tr>\r\n"
					+ "    </tbody>\r\n"
					+ "</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnDividerBlock\" style=\"min-width:100%;\">\r\n"
					+ "    <tbody class=\"mcnDividerBlockOuter\">\r\n"
					+ "        <tr>\r\n"
					+ "            <td class=\"mcnDividerBlockInner\" style=\"min-width:100%; padding:18px;\">\r\n"
					+ "                <table class=\"mcnDividerContent\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-top: 2px solid #EAEAEA;\">\r\n"
					+ "                    <tbody><tr>\r\n"
					+ "                        <td>\r\n"
					+ "                            <span></span>\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                </tbody></table>\r\n"
					+ "<!--            \r\n"
					+ "                <td class=\"mcnDividerBlockInner\" style=\"padding: 18px;\">\r\n"
					+ "                <hr class=\"mcnDividerContent\" style=\"border-bottom-color:none; border-left-color:none; border-right-color:none; border-bottom-width:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:0; margin-bottom:0; margin-left:0;\" />\r\n"
					+ "-->\r\n"
					+ "            </td>\r\n"
					+ "        </tr>\r\n"
					+ "    </tbody>\r\n"
					+ "</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnImageBlock\" style=\"min-width:100%;\">\r\n"
					+ "    <tbody class=\"mcnImageBlockOuter\">\r\n"
					+ "            <tr>\r\n"
					+ "                <td valign=\"top\" style=\"padding:9px\" class=\"mcnImageBlockInner\">\r\n"
					+ "                    <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"min-width:100%;\">\r\n"
					+ "                        <tbody><tr>\r\n"
					+ "                            <td class=\"mcnImageContent\" valign=\"top\" style=\"padding-right: 9px; padding-left: 9px; padding-top: 0; padding-bottom: 0; text-align:center;\">\r\n"
					+ "                                \r\n"
					+ "                                    \r\n"
					+ "                                        <img align=\"center\" alt=\"\" src=\"https://mcusercontent.com/551ddeac53525bfdf4613727d/images/282643fe-66cf-4d50-99af-cdcfff1c40de.png\" width=\"245.84000000000003\" style=\"max-width:439px; padding-bottom: 0; display: inline !important; vertical-align: bottom;\" class=\"mcnImage\">\r\n"
					+ "                                    \r\n"
					+ "                                \r\n"
					+ "                            </td>\r\n"
					+ "                        </tr>\r\n"
					+ "                    </tbody></table>\r\n"
					+ "                </td>\r\n"
					+ "            </tr>\r\n"
					+ "    </tbody>\r\n"
					+ "</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnTextBlock\" style=\"min-width:100%;\">\r\n"
					+ "    <tbody class=\"mcnTextBlockOuter\">\r\n"
					+ "        <tr>\r\n"
					+ "            <td valign=\"top\" class=\"mcnTextBlockInner\" style=\"padding-top:9px;\">\r\n"
					+ "              	<!--[if mso]>\r\n"
					+ "				<table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"width:100%;\">\r\n"
					+ "				<tr>\r\n"
					+ "				<![endif]-->\r\n"
					+ "			    \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				<td valign=\"top\" width=\"600\" style=\"width:600px;\">\r\n"
					+ "				<![endif]-->\r\n"
					+ "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%; min-width:100%;\" width=\"100%\" class=\"mcnTextContentContainer\">\r\n"
					+ "                    <tbody><tr>\r\n"
					+ "                        \r\n"
					+ "                        <td valign=\"top\" class=\"mcnTextContent\" style=\"padding-top:0; padding-right:18px; padding-bottom:9px; padding-left:18px;\">\r\n"
					+ "                        \r\n"
					+ "                            <span style=\"font-size:22px\">親愛的 " + orderBean.getMemberBean().getFullname() +  " 會員您好：</span><br>\r\n"
					+ "此訊息為通知您此次在 Yachi 商城的訂購已完成！<br>\r\n"
					+ "感謝您對 Yachi 的支持，<br>\r\n"
					+ "若有任何問題可至 Yachi <a href=\"http://localhost:8080/yachi/\" target=\"_blank\">會員中心-訂單查詢</a>&nbsp;查詢相關明細，謝謝您！<br>\r\n"
					+ "&nbsp;\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                </tbody></table>\r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</td>\r\n"
					+ "				<![endif]-->\r\n"
					+ "                \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</tr>\r\n"
					+ "				</table>\r\n"
					+ "				<![endif]-->\r\n"
					+ "            </td>\r\n"
					+ "        </tr>\r\n"
					+ "    </tbody>\r\n"
					+ "</table><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnTextBlock\" style=\"min-width:100%;\">\r\n"
					+ "    <tbody class=\"mcnTextBlockOuter\">\r\n"
					+ "        <tr>\r\n"
					+ "            <td valign=\"top\" class=\"mcnTextBlockInner\" style=\"padding-top:9px;\">\r\n"
					+ "              	<!--[if mso]>\r\n"
					+ "				<table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"width:100%;\">\r\n"
					+ "				<tr>\r\n"
					+ "				<![endif]-->\r\n"
					+ "			    \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				<td valign=\"top\" width=\"600\" style=\"width:600px;\">\r\n"
					+ "				<![endif]-->\r\n"
					+ "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%; min-width:100%;\" width=\"100%\" class=\"mcnTextContentContainer\">\r\n"
					+ "                    <tbody><tr>\r\n"
					+ "                        \r\n"
					+ "                        <td valign=\"top\" class=\"mcnTextContent\" style=\"padding-top:0; padding-right:18px; padding-bottom:9px; padding-left:18px;\">\r\n"
					+ "                        \r\n"
					+ "                            <span style=\"font-size:20px\"><strong>訂單編號：</strong>" + orderBean.getOrderNumber() + "<br>\r\n"
					+ "<strong>訂購時間：</strong>" + orderTime +"<br>\r\n"
					+ "<strong>預計配送日期：</strong>" + shipTime + "</span><br>\r\n"
					+ "&nbsp;\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                </tbody></table>\r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</td>\r\n"
					+ "				<![endif]-->\r\n"
					+ "                \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</tr>\r\n"
					+ "				</table>\r\n"
					+ "				<![endif]-->\r\n"
					+ "            </td>\r\n"
					+ "        </tr>\r\n"
					+ "    </tbody>\r\n"
					+ "</table></td>\r\n"
					+ "                            </tr>\r\n"
					+ "                            <tr>\r\n"
					+ "                                <td valign=\"top\" id=\"templateFooter\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"mcnTextBlock\" style=\"min-width:100%;\">\r\n"
					+ "    <tbody class=\"mcnTextBlockOuter\">\r\n"
					+ "        <tr>\r\n"
					+ "            <td valign=\"top\" class=\"mcnTextBlockInner\" style=\"padding-top:9px;\">\r\n"
					+ "              	<!--[if mso]>\r\n"
					+ "				<table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"width:100%;\">\r\n"
					+ "				<tr>\r\n"
					+ "				<![endif]-->\r\n"
					+ "			    \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				<td valign=\"top\" width=\"600\" style=\"width:600px;\">\r\n"
					+ "				<![endif]-->\r\n"
					+ "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:100%; min-width:100%;\" width=\"100%\" class=\"mcnTextContentContainer\">\r\n"
					+ "                    <tbody><tr>\r\n"
					+ "                        \r\n"
					+ "                        <td valign=\"top\" class=\"mcnTextContent\" style=\"padding-top:0; padding-right:18px; padding-bottom:9px; padding-left:18px;\">\r\n"
					+ "                        \r\n"
					+ "                            <br>\r\n"
					+ "<em>Copyright © 2021 yachi, All rights reserved.</em><br>\r\n"
					+ "聯絡我們：<a href=\"mailto:yachijava015@gmail.com\" target=\"_blank\">yachijava015@gmail.com</a>\r\n"
					+ "                        </td>\r\n"
					+ "                    </tr>\r\n"
					+ "                </tbody></table>\r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</td>\r\n"
					+ "				<![endif]-->\r\n"
					+ "                \r\n"
					+ "				<!--[if mso]>\r\n"
					+ "				</tr>\r\n"
					+ "				</table>\r\n"
					+ "				<![endif]-->\r\n"
					+ "            </td>\r\n"
					+ "        </tr>\r\n"
					+ "    </tbody>\r\n"
					+ "</table></td>\r\n"
					+ "                            </tr>\r\n"
					+ "                        </table>\r\n"
					+ "                        <!--[if (gte mso 9)|(IE)]>\r\n"
					+ "                        </td>\r\n"
					+ "                        </tr>\r\n"
					+ "                        </table>\r\n"
					+ "                        <![endif]-->\r\n"
					+ "                        <!-- // END TEMPLATE -->\r\n"
					+ "                    </td>\r\n"
					+ "                </tr>\r\n"
					+ "            </table>\r\n"
					+ "        </center>\r\n"
					+ "    </body>\r\n"
					+ "</html>\r\n"
					+ "";
					
			message.setContent(messageStr, "text/html; charset=UTF-8");
//			message.setContent(messageStr, "text/html");
			Transport.send(message);
			
			System.out.println("Successfully sent Verification Link");
			
		} catch (Exception e) {
			System.out.println("Error at SendingEmail.java: " + e);
		}
		
	}
	
}
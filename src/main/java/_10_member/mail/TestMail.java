package _10_member.mail;



public class TestMail {

	public TestMail() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		String code = "givemesomecode";
		new Thread(new MailUtil("acadia891250@gmail.com", code)).start();
	}

}

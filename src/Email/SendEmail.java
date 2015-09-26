package Email;

/**
 * Created by zhiyou on 15-7-1.
 * 使用的是163的mspt服务
 */
public class SendEmail {
    public void lvsendemail(String name3,String agree,String classroom,String tmail) {
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);
        mailInfo.setUserName("18753377270@163.com");//三号楼老师的邮箱
        mailInfo.setPassword("zhang192819");//审核老师的邮箱密码
        mailInfo.setFromAddress("18753377270@163.com");//发邮件的邮箱地址
        mailInfo.setToAddress(tmail);//接受邮箱的邮箱地址
        mailInfo.setSubject("老师审核教室");
        mailInfo.setContent(name3 + "你申请的"+classroom+"审核结果:"+agree);
        SimpleMailSender sms = new SimpleMailSender();
        sms.sendTextMail(mailInfo);//发送文体格式
    }
}

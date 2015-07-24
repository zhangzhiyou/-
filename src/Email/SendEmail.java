package Email;

/**
 * Created by zhiyou on 15-7-1.
 */
public class SendEmail {
    public void send(String name3,String classroom,String applytime) {
        MailSenderInfo mailInfo = new MailSenderInfo();
        // MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);
        mailInfo.setUserName("18753377270@163.com");//三号楼老师的邮箱
        mailInfo.setPassword("*****");//三号楼老师的邮箱密码
        mailInfo.setFromAddress("18753377270@163.com");//发邮件的邮箱地址
        mailInfo.setToAddress("858667680@qq.com");//接受邮箱的邮箱地址
        mailInfo.setSubject("老师审核教室");
        mailInfo.setContent(name3 + "想申请" + classroom + "教室  申请使用教室的时间" + applytime);
        SimpleMailSender sms = new SimpleMailSender();
        sms.sendTextMail(mailInfo);//发送文体格式
    }
    public void lvsendemail(String name3,String agree,String classroom,String tmail) {
        MailSenderInfo mailInfo = new MailSenderInfo();
        // MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);
        mailInfo.setUserName("18753377270@163.com");//三号楼老师的邮箱
        mailInfo.setPassword("******");//审核老师的邮箱密码
        mailInfo.setFromAddress("18753377270@163.com");//发邮件的邮箱地址
        mailInfo.setToAddress(tmail);//接受邮箱的邮箱地址
        mailInfo.setSubject("老师审核教室");
        mailInfo.setContent(name3 + "你申请的"+classroom+"审核结果:"+agree);
        SimpleMailSender sms = new SimpleMailSender();
        sms.sendTextMail(mailInfo);//发送文体格式
    }
}

package com.Modoomoyeo.momo.user;

import com.Modoomoyeo.momo.user.findPW.RedisUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Random;

@Slf4j
@RequiredArgsConstructor
@Service
public class MailService {

    private final JavaMailSender emailSender;
    private final RedisUtil redisUtil;

    public String sendEmailMessage(String email){
        String code = createCode(); // 인증코드 생성
        try {
            redisUtil.setDataExpire(code, email, 60*5L); // 유효기간 5분

            MimeMessage message = emailSender.createMimeMessage();
            message.addRecipients(MimeMessage.RecipientType.TO, email); // 보낼 이메일 설정
            message.setSubject("[MOMO] 인증코드 입니다."); // 이메일 제목
            message.setText("변경된 임시 비밀번호는"+code+"입니다." , "utf-8", "text"); // 내용 설정
            emailSender.send(message); // 이메일 전송

        } catch (Exception e) {
            e.printStackTrace();
        }
        return code;
    }


    private String createCode() {
        StringBuilder code = new StringBuilder();
        Random rnd = new Random();
        for (int i = 0; i < 6; i++) {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
                case 0: // a ~ z
                    code.append((char) (rnd.nextInt(26) + 97));
                    break;
                case 1: // A ~ Z
                    code.append((char) (rnd.nextInt(26) + 65));
                    break;
                case 2: // 0 ~ 9
                    code.append((rnd.nextInt(10)));
                    break;
            }
        }
        return code.toString();
    }


}

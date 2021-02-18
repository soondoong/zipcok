package zipcok.sms.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import zipcok.sms.SmsSend;

@Controller
public class SmsController {

	@RequestMapping(value="/smsForm.do")
	public String gosms() {
		return "sms/smsForm";
	}
	
	@RequestMapping("sendSms.do")
	 public @ResponseBody String sendSMS(String phoneNumber) {
			System.out.println("컨트롤러도착");
	        Random rand  = new Random();
	        String numStr = "";
	        for(int i=0; i<6; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr+=ran;
	        }
	     
	        System.out.println("수신자 번호 : " + phoneNumber);
	        System.out.println("인증번호 : " + numStr);
	      SmsSend ss=new SmsSend();
	      ss.sendCertifiedNumber(phoneNumber, numStr);
	        return numStr;
	    }

}

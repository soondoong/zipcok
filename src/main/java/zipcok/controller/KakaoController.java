package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoController {
	
	@RequestMapping("/kakaoLoginForm.do")
	public String kakaoLoginForm() {
		return "member/kakaoLoginForm";
	}

	@RequestMapping("/kakaoLogin.do")
    public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
        System.out.println("#########" + code);
        return "member/kakaoLoginForm";
    }

}

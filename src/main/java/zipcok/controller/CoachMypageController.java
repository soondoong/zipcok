package zipcok.controller;

import java.util.*;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import zipcok.coachmypage.model.CoachMypageDAO;
import zipcok.mypage.model.MypageDAO;

@Controller
public class CoachMypageController {

	@Autowired
	private CoachMypageDAO cdao;
	
	@Autowired
	ServletContext c;
	
	@RequestMapping("/coachProfileForm.do")
	public String coachMypageProfile() {
		
		return "coachmypage/coachProfile";
	}
	
		
}

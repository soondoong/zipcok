package zipcok.admin.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import zipcok.coach.model.CoachDTO;
import zipcok.member.model.MemberAllDTO;

public interface AdminCoachMatchDAO {
	
	public int coachMatchTotalCnt(HashMap<String, Object> map);//코치관리페이지 총 게시물 수 구하기
	public List<MemberAllDTO> coachMatchSearch(HashMap<String, Object> map);//코치관리페이지 리스트 뽑기
	public CoachDTO adminCoachProfile(String id);
	public List<String> adminToCharDate(String id);
}

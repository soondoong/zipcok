package zipcok.coachmypage.model;

import java.util.*;

import zipcok.coach.model.CategoryDTO;
import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.CurriDTO;
import zipcok.member.model.MemberDTO;

public interface CoachMypageDAO {
	
	public int requestDelete(int req_idx) ;
	public int requestStatusChange(int req_idx) ;
	public int coachMypageHomeGymLikeListTotalCnt(String mem_id);
	public List coachMypageHomeGymLikeList(int cp, int ls, String mem_id);
	public int coachMypageWriteListTotalCnt(String mem_id);
	public List coachMypageWriteList(int cp, int ls, String mem_id);
	public MemberDTO coachMypageProfile(String mem_id);
	public int coachMypagePwdUpdate(MemberDTO dto);
	public int coachMypageAddrUpdate(MemberDTO dto);
	public int coachMypageEmailUpdate(MemberDTO dto);
	public int coachMypagePhoneUpdate(MemberDTO dto);
	public CoachFileDTO findProfileDTO(String id); //프로필파일수정
	public int deleteProfileImg(CoachFileDTO dto); //프로필파일수정
	public int insertProfileImg(CoachFileDTO dto); //프로필파일수정
	public List<CategoryDTO> categoryFind(String id);//아이디로 카테고리찾기
	public int categoryinsert(CategoryDTO dto);//카테고리넣기
	public int categoryDelete(HashMap<String,String> map);//카테고리삭제
	public int curriDelete(HashMap<String,String> map); //커리큘럼삭제
	public void curriInsert(CurriDTO cdto);//커리큘럼등록
}

package zipcok.coachmypage.model;

import java.util.*;

import zipcok.coach.model.CategoryDTO;
import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.CurriDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.member.model.MemberDTO;

public interface CoachMypageDAO {
	
	public int requestDelete(int req_idx) ;
	public int requestStatusChange(int req_idx) ; //상담요청서 상태변경
	public int reqStatusChangetoOk(int req_idx,String status); //상담요청서 상태변경
	public int coachMypageHomeGymLikeListTotalCnt(String mem_id);
	public List coachMypageHomeGymLikeList(int cp, int ls, String mem_id);
	public int coachMypageWriteListTotalCnt(String mem_id);//작성글 수
	public List coachMypageWriteList(int cp, int ls, String mem_id);//작성글 목록
	public int coachMypageWriteDelete(String checkArr);//작성글 삭제
	public int coachMypageCommWriteListTotalCnt(String ex_id);//커뮤니티 작성글 수
	public List coachMypageCommWriteList(int cp, int ls, String ex_id);//커뮤니티 작성글 목록
	public int coachMypageCommWriteDelete(String checkArr);//커뮤니티 작성글 삭제
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
	public void curriInsert(CurriDTO cdto);//커리큘럼등록
	public void curriUpdate(CurriDTO cdto);//커리큘럼수정
	public void curriDelete(CurriDTO cdto);//커리큘럼 삭제
	public List<Pd_AllDTO> CmPaymentList(HashMap<String,Object> map); //코치매칭된결제내역
}

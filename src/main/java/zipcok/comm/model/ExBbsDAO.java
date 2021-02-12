package zipcok.comm.model;

import java.util.*;

public interface ExBbsDAO {
	
	public int dailyWrite(ExBbsDTO dto,String coachid);//글쓰기
	public int getMaxExIdx();//최근글 idx구하기
	public int getExSunbun(int ex_comm_idx,int group);//그룹 내 최대 순번 구하기
	public List dailyList(int cp,int ls,int ex_comm_idx);//글목록 불러오기
	public int getTotalCnt(int ex_comm_idx);//총 게시물 수 구하기
	public ExBbsDTO dailyContent(int idx);//글 보기
	public int dailyUpdate(ExBbsDTO dto);//글 수정
	public int dailyDelete(int ex_idx);//글 삭제(멤버)
	public int dailyGetGroup(int ex_idx);//그룹값 가져오기
	public int dailyDeleteCoach(int ex_group);//글 삭제(코치)
	public int dailyReadnum(int ex_idx);//조회수 불러오기
	public int findRownum(int ex_idx,int ex_comm_idx);//이전글다음글하기위한로우넘구하는메서드
	public ExBbsDTO dailyPrevNext(int rnum,int ex_comm_idx);//이전글다음글
	public ExBbsDTO recentCoachContent(int ex_comm_idx,String ex_id);//코치가 쓴 최근 글 구하기
	
	//댓글
	public int dailyGetMaxSunbun(int re_idx);//댓글 최대 순번 구하기
	public int dailyReWrite(ExReBbsDTO dto);//댓글 쓰기
	public int dailyReDelete(int re_group);//댓글 삭제
	public int dailyReReDelete(int re_idx);//대댓글 삭제
	public List dailyReList(int re_bbs_idx);//댓글 뿌려주기
	public int dailyGetTotalRe(int re_bbs_idx);//댓글 갯수 구하기
	public int dailySetTotalRe(int ex_recnt,int ex_idx);//총 댓글 갯수 입력하기
	public int dailyGetSunbun_p(int re_idx);//부모댓글 순번구하기
	public int dailyGetLev(int re_idx);//부모댓글 레벨구하기
	public void dailyReUpdate(int ex_idx, int re_sunbun);//댓글 순서 업데이트
	public int dailyReReWrite(ExReBbsDTO dto);//대댓글 쓰기

}

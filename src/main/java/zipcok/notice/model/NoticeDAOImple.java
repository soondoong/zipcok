package zipcok.notice.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeDAOImple implements NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;

	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//글쓰기 메서드
	public int noticeWrite(NoticeDTO dto) {
		int count=sqlMap.insert("noticeWriteSQL", dto);
		return count;
	}
	

	//모든 리스트 메서드
	public List noticeAllList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		      List list=sqlMap.selectList("noticeAllListSQL", map);
		      return list;
	}
	
	//총 게시물 수 메서드
	public int getTotalCnt() {
		int count=sqlMap.selectOne("noticeTotalCnt");
		return count==0?1:count;
	}
	
	//본문보기 메서드
	public NoticeDTO noticeContent(int bbs_idx) {
		NoticeDTO dto=sqlMap.selectOne("noticeContentSQL",bbs_idx);
		return dto;
	}
	
	//카테고리 검색 리스트 메서드
	public List noticeSearchList(int cp, int ls,String bbs_category) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		map.put("bbs_category", bbs_category);
			List list=sqlMap.selectList("noticeSearchListSQL", map);
			return list;
	}
	
	//업데이트 메서드
	public int noticeUpdate(NoticeDTO dto) {
		int count=sqlMap.update("noticeUpdateSQL", dto);
		return count;
	}
	
	//본문 삭제 메서드
	public int noticeDelete(int bbs_idx) {
		int count=sqlMap.delete("noticeDeleteSQL", bbs_idx);
		return count;
	}
	
	//조회수 메서드
	@Override
	public int noticeReadnum(int bbs_idx) {
		int count=sqlMap.update("noticeReadnumSQL",bbs_idx);
		return count;
	}
	
	//rownum찾기
	@Override
	public int findRownum(int bbs_idx) {
		int result=sqlMap.selectOne("findrownumSQL",bbs_idx);
		return result;
	}

	//이전글 다음글
	@Override
	public NoticeDTO noticePrevNext(int rnum) {
		NoticeDTO dto=sqlMap.selectOne("prevnextSQL", rnum);
		return dto;
	}

}

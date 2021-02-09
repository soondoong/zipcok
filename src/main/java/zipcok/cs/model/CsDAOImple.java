package zipcok.cs.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CsDAOImple implements CsDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	public CsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int getTotalCnt() {
		int count=sqlMap.selectOne("csTotalCnt");
		return count==0?1:count;
	}
	
	@Override
	public List csAllList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		List list=sqlMap.selectList("csAllListSQL", map);
		return list;
	}
	
	@Override
	public int csWrite(CsDTO dto) {
		int count=sqlMap.insert("csWriteSQL",dto);
		
		return count;
	}
	
	//파일 업로드
	@Override
	public int csFileUpload(ArrayList<CsZipcokFileDTO> fileArr) {
		int count=0;
		
		for(int i=0; i<fileArr.size(); i++) {
		count+=sqlMap.insert("insertCsInfoFile",fileArr.get(i));
		}
		return count;
	}
	//본문삭제
	@Override
	public int csDelete(int bbs_idx) {
		int count=sqlMap.delete("csDeleteSQL", bbs_idx);
		return count;
	}
	
		
	//게시물수정
	@Override
	public int csUpdate(CsDTO dto) {
		int count=sqlMap.update("csUpdateSQL", dto);
		return count;
	}
	//본문보기
	@Override
	public CsDTO csContent(int bbs_idx) {
			CsDTO dto=sqlMap.selectOne("csContentSQL",bbs_idx);
			return dto;
	}
	//최신글 idx 받아오기
	@Override
	public int csMaxIdx() {
		int maxIdx = sqlMap.selectOne("csmaxIdx");
		return maxIdx;
	}
	//파일 리스트 받아오기
	@Override
	public List<CsZipcokFileDTO> CsZfileSelect(int bbs_idx) {
		List<CsZipcokFileDTO> list=sqlMap.selectList("csZfileSelect", bbs_idx);
		return list;
	}
	
	//조회수 받아오기
	@Override
	public int csReadnum(int bbs_idx) {
		int count=sqlMap.update("csReadnumSQL", bbs_idx);
		return count;
	}
	//파일 del_yn 바꿔주는 메서드(게시글idx이용)
	public int csAndFileDel(int bbs_idx) {
		int count=sqlMap.update("cszfileDelete2", bbs_idx);
		return count;
	}
	//del_yn y로 변경해주기(사진삭제버튼누를때)
	@Override
	public int deleteCsFile(String fileName) {
		int result=sqlMap.update("cszfileDelete", fileName);
		return result;
	}
	//del_yn y 인 데이터 삭제(수정하기누를때, 리스트로 갈때)
	@Override
	public int cszfileRealDelete() {
		int result=sqlMap.delete("cszfileRealDelete");
		return result;
	}
	
	
	//답변달기
	@Override
	public int csReWrite(CsReDTO dto) {
		int count=sqlMap.insert("csReWrite", dto);
		return count;
	}
	
	//고객센터 답변 가져오기
	@Override
	public CsReDTO csReList(int re_bbs_idx) {
		CsReDTO dto=sqlMap.selectOne("csReList",re_bbs_idx);
		return dto;
	}
	//고객센터 답변 지우기
	@Override
	public int csReDelete(int re_idx) {
		int count=sqlMap.delete("csReDelete",re_idx);
		return count;
	}
}

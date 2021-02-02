package zipcok.cs.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.notice.model.NoticeDTO;
import zipcok.notice.model.ZipcokFileDTO;

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
	
	@Override
	public int csMaxIdx() {
		int maxIdx = sqlMap.selectOne("csmaxIdx");
		return maxIdx;
	}
	
	@Override
	public List<CsZipcokFileDTO> CsZfileSelect(int bbs_idx) {
		List<CsZipcokFileDTO> list=sqlMap.selectList("csZfileSelect", bbs_idx);
		return null;
	}
	
	
	@Override
	public int csReadnum(int bbs_idx) {
		int count=sqlMap.update("csReadnumSQL", bbs_idx);
		return count;
	}
	@Override
	public int deleteCsFile(CsZipcokFileDTO dto) {
		int result=sqlMap.update("csZfileDelete", dto);
		return result;
	}
}

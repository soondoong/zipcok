package zipcok.coach.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.javafx.collections.MappingChange.Map;


@Service
public class CoachDAOImple implements CoachDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	/*카테고리별 전체코치리스트 불러오기*/
	@Override
	public HashMap<String, List<MainCoachDTO>> mainCoachList() {
		HashMap<String, List<MainCoachDTO>> map=new HashMap<String, List<MainCoachDTO>>();
		List<MainCoachDTO> ptList=sqlMap.selectList("findCategoryCoachPT");
		map.put("pt", ptList);
		
		List<MainCoachDTO> yogaList=sqlMap.selectList("findCategoryCoachYoga");
		map.put("yoga", yogaList);
		return map ;
	}
	
	
	/*검색된 코치 가져오기 페이징까지*/
	@Override
	public List<MainCoachDTO> searchCoachList(HashMap<String, Object> keys,int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		keys.put("start",start);
		keys.put("end",end);
		
		List<MainCoachDTO> searchList=sqlMap.selectList("searchCoachByKey",keys);
		
		return searchList;
	}
	
	
	/*검색된 코치 총 갯수 가져오기*/
	@Override
	public int getTotalCnt(HashMap map) {
		int count=sqlMap.selectOne("totalCnt",map);
		//총게시물수가 0이면오류나니까 
		System.out.println("총검색된수"+count);
		return count==0?1:count;
	}
	
	
	/*코치등록하기*/
	@Override
	public int coachJoin(MainCoachDTO dto) {
	    int count=sqlMap.insert("coachRegist",dto);
		count=sqlMap.insert("insertCategory",dto);
		return count;
	}
	
	

}

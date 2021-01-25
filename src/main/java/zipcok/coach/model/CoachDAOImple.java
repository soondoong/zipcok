package zipcok.coach.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CoachDAOImple implements CoachDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public HashMap<String, List<MainCoachDTO>> mainCoachList() {
		HashMap<String, List<MainCoachDTO>> map=new HashMap<String, List<MainCoachDTO>>();
		List<MainCoachDTO> ptList=sqlMap.selectList("findCategoryCoachPT");
		map.put("pt", ptList);
		
		List<MainCoachDTO> yogaList=sqlMap.selectList("findCategoryCoachYoga");
		map.put("yoga", yogaList);
		return map ;
	}

}

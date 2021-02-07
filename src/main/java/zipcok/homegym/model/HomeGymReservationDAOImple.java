package zipcok.homegym.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeGymReservationDAOImple implements HomeGymReservationDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public HomeGymReservationDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int HomeGymReservationAdd(HomeGymReservationDTO dto) {
		int result = sqlMap.insert("hgReservationAddSQL", dto);
		return result;
	}
	@Override
	public int HomeGymReservationMaxIdxFind() {
		int result = sqlMap.selectOne("hgReservationMaxIdxFindSQL");
		return result;
	}
	@Override
	public HomeGymReservationDTO homeGymReservationSelect(int reser_idx) {
		HomeGymReservationDTO dto = sqlMap.selectOne("hgReservationSelectSQL", reser_idx);
		return dto;
	}
}

package zipcok.homegym.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
@Service
public class Payment_detailsDAOImple implements Payment_detailsDAO {

	private SqlSessionTemplate sqlMap;
	
	public Payment_detailsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int PaymentListAdd(Payment_detailsDTO dto) {
		int result = sqlMap.insert("PaymentListAddSQL", dto);
		return result;
	}

	@Override
	public List<Payment_detailsDTO> PaymentList() {
		// TODO Auto-generated method stub
		return null;
	}

}

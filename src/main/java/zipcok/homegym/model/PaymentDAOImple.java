package zipcok.homegym.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentDAOImple implements PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public PaymentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int HomeGymPaymentAdd(PaymentDTO dto) {
		int payment_result = sqlMap.insert("PaymenAddSQL", dto);
		return payment_result;
	}
}

package zipcok.homegym.model;

import java.util.List;

public interface Payment_detailsDAO {
	public int Payment_Add(Payment_detailsDTO dto);
	public List<Payment_detailsDTO> Payment_List();
}

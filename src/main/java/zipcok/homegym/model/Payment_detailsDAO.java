package zipcok.homegym.model;

import java.util.List;

public interface Payment_detailsDAO {
	public int PaymentListAdd(Payment_detailsDTO dto);
	public List<Payment_detailsDTO> PaymentList();
	public int ReserIdxFind(int pd_idx);
}
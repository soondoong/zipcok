package zipcok.admin.model;

public interface AdminStatsHomegymRegistDAO {
	
	public int GetNewHomeGymCount(String date);//날짜별로 신규 등록 홈짐 수 구하기
	public int GetStatusOnHomeGymCount(String date);//활성화 된 홈짐 수 구하기
	public int GetPaymentHomegymCount(String date);//거래된 홈짐 수 구하기

}

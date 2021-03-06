package zipcok.admin.model;

public interface AdminStatsMemberDAO {
	
	public int GetMemTypeCount(String mem_type);//멤버타입에 따른 회원수 구하기
	public int GetMemJoinDateCountSum(String startDate, String endDate);//날짜에 따른 총 가입자 수 구하기
	public int GetMemJoinDate(String date);//해당 날짜 가입자 수 구하기
	public int GetMemOutDateCountSum(String startDate, String endDate);//날짜에 따른 총 탈퇴자 수 구하기
	public int GetMemOutDate(String date);//해당 날짜 탈퇴자 수 구하기
	public int GetCoachJoinDate(String date);//해당 날짜 코치 전환 수 구하기
	

}

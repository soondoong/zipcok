package zipcok.homegym.model;

public interface HomeGymReservationDAO {
	public int HomeGymReservationAdd(HomeGymReservationDTO dto);
	public int HomeGymReservationMaxIdxFind();
	public HomeGymReservationDTO homeGymReservationSelect(int reser_idx);
}

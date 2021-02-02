package zipcok.homegym.model;

public class HomeGymEquipmentDTO {
	private int eq_idx;
	private String eq_mem_id;
	private String eq_name;
	private int eq_count;
	public HomeGymEquipmentDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getEq_idx() {
		return eq_idx;
	}

	public void setEq_idx(int eq_idx) {
		this.eq_idx = eq_idx;
	}

	public String getEq_mem_id() {
		return eq_mem_id;
	}

	public void setEq_mem_id(String eq_mem_id) {
		this.eq_mem_id = eq_mem_id;
	}

	public String getEq_name() {
		return eq_name;
	}

	public void setEq_name(String eq_name) {
		this.eq_name = eq_name;
	}

	public int getEq_count() {
		return eq_count;
	}

	public void setEq_count(int eq_count) {
		this.eq_count = eq_count;
	}

	public HomeGymEquipmentDTO(int eq_idx, String eq_mem_id, String eq_name, int eq_count) {
		super();
		this.eq_idx = eq_idx;
		this.eq_mem_id = eq_mem_id;
		this.eq_name = eq_name;
		this.eq_count = eq_count;
	}

	
	
}

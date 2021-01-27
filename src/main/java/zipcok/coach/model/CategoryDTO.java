package zipcok.coach.model;

public class CategoryDTO {

	private int cate_idx;
	private String cate_mem_id;
	private String cate_name;
	
	public CategoryDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getCate_idx() {
		return cate_idx;
	}

	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}

	public String getCate_mem_id() {
		return cate_mem_id;
	}

	public void setCate_mem_id(String cate_mem_id) {
		this.cate_mem_id = cate_mem_id;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public CategoryDTO(int cate_idx, String cate_mem_id, String cate_name) {
		super();
		this.cate_idx = cate_idx;
		this.cate_mem_id = cate_mem_id;
		this.cate_name = cate_name;
	}
	
	
}

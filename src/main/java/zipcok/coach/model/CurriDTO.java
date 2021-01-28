package zipcok.coach.model;

public class CurriDTO {
	
	private int curri_idx;
	private String curri_mem_id;
	private String curri_catename;
	private int curri_order;
	private String name;
	private String curri_content;
	
	public CurriDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getCurri_idx() {
		return curri_idx;
	}

	public void setCurri_idx(int curri_idx) {
		this.curri_idx = curri_idx;
	}

	public String getCurri_mem_id() {
		return curri_mem_id;
	}

	public void setCurri_mem_id(String curri_mem_id) {
		this.curri_mem_id = curri_mem_id;
	}

	public String getCurri_catename() {
		return curri_catename;
	}

	public void setCurri_catename(String curri_catename) {
		this.curri_catename = curri_catename;
	}

	public int getCurri_order() {
		return curri_order;
	}

	public void setCurri_order(int curri_order) {
		this.curri_order = curri_order;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCurri_content() {
		return curri_content;
	}

	public void setCurri_content(String curri_content) {
		this.curri_content = curri_content;
	}

	public CurriDTO(int curri_idx, String curri_mem_id, String curri_catename, int curri_order, String name,
			String curri_content) {
		super();
		this.curri_idx = curri_idx;
		this.curri_mem_id = curri_mem_id;
		this.curri_catename = curri_catename;
		this.curri_order = curri_order;
		this.name = name;
		this.curri_content = curri_content;
	}
	
	

}

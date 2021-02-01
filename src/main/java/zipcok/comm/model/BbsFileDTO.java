package zipcok.comm.model;

public class BbsFileDTO {
	
	private int bflie_idx; //글번호
	private String bfile_bbs; //게시판 구분자
	private String bfile_rename; //업로드 파일명
	private int bfile_size; //파일크기
	private String bfile_origin; //파일원본명
	private String bfile_path; //파일저장경로
	private String bfile_type; //파일유형
	private String bfile_comm; //커뮤니티 구분자
	private String bfile_meal; //끼니 구분자
	
	public BbsFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BbsFileDTO(int bflie_idx, String bfile_bbs, String bfile_rename, int bfile_size, String bfile_origin,
			String bfile_path, String bfile_type, String bfile_comm, String bfile_meal) {
		super();
		this.bflie_idx = bflie_idx;
		this.bfile_bbs = bfile_bbs;
		this.bfile_rename = bfile_rename;
		this.bfile_size = bfile_size;
		this.bfile_origin = bfile_origin;
		this.bfile_path = bfile_path;
		this.bfile_type = bfile_type;
		this.bfile_comm = bfile_comm;
		this.bfile_meal = bfile_meal;
	}

	public int getBflie_idx() {
		return bflie_idx;
	}

	public void setBflie_idx(int bflie_idx) {
		this.bflie_idx = bflie_idx;
	}

	public String getBfile_bbs() {
		return bfile_bbs;
	}

	public void setBfile_bbs(String bfile_bbs) {
		this.bfile_bbs = bfile_bbs;
	}

	public String getBfile_rename() {
		return bfile_rename;
	}

	public void setBfile_rename(String bfile_rename) {
		this.bfile_rename = bfile_rename;
	}

	public int getBfile_size() {
		return bfile_size;
	}

	public void setBfile_size(int bfile_size) {
		this.bfile_size = bfile_size;
	}

	public String getBfile_origin() {
		return bfile_origin;
	}

	public void setBfile_origin(String bfile_origin) {
		this.bfile_origin = bfile_origin;
	}

	public String getBfile_path() {
		return bfile_path;
	}

	public void setBfile_path(String bfile_path) {
		this.bfile_path = bfile_path;
	}

	public String getBfile_type() {
		return bfile_type;
	}

	public void setBfile_type(String bfile_type) {
		this.bfile_type = bfile_type;
	}

	public String getBfile_comm() {
		return bfile_comm;
	}

	public void setBfile_comm(String bfile_comm) {
		this.bfile_comm = bfile_comm;
	}

	public String getBfile_meal() {
		return bfile_meal;
	}

	public void setBfile_meal(String bfile_meal) {
		this.bfile_meal = bfile_meal;
	}

	
	
	
	

}

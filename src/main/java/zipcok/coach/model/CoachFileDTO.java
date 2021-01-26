package zipcok.coach.model;

public class CoachFileDTO {

	private int mfile_idx;
	private String mfile_key;
	private String mfile_mem_id;
	private String mfile_upload; //년월시분초붙은이름
	private int mfile_size;
	private String mfile_orig; //원본이름
	private String mfile_path;
	private String mfile_type; //이미지인지동영상인지
	
	public CoachFileDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getMfile_idx() {
		return mfile_idx;
	}

	public void setMfile_idx(int mfile_idx) {
		this.mfile_idx = mfile_idx;
	}

	public String getMfile_key() {
		return mfile_key;
	}

	public void setMfile_key(String mfile_key) {
		this.mfile_key = mfile_key;
	}

	public String getMfile_mem_id() {
		return mfile_mem_id;
	}

	public void setMfile_mem_id(String mfile_mem_id) {
		this.mfile_mem_id = mfile_mem_id;
	}

	public String getMfile_upload() {
		return mfile_upload;
	}

	public void setMfile_upload(String mfile_upload) {
		this.mfile_upload = mfile_upload;
	}

	public int getMfile_size() {
		return mfile_size;
	}

	public void setMfile_size(int mfile_size) {
		this.mfile_size = mfile_size;
	}

	public String getMfile_orig() {
		return mfile_orig;
	}

	public void setMfile_orig(String mfile_orig) {
		this.mfile_orig = mfile_orig;
	}

	public String getMfile_path() {
		return mfile_path;
	}

	public void setMfile_path(String mfile_path) {
		this.mfile_path = mfile_path;
	}

	public String getMfile_type() {
		return mfile_type;
	}

	public void setMfile_type(String mfile_type) {
		this.mfile_type = mfile_type;
	}

	public CoachFileDTO(int mfile_idx, String mfile_key, String mfile_mem_id, String mfile_upload, int mfile_size,
			String mfile_orig, String mfile_path, String mfile_type) {
		super();
		this.mfile_idx = mfile_idx;
		this.mfile_key = mfile_key;
		this.mfile_mem_id = mfile_mem_id;
		this.mfile_upload = mfile_upload;
		this.mfile_size = mfile_size;
		this.mfile_orig = mfile_orig;
		this.mfile_path = mfile_path;
		this.mfile_type = mfile_type;
	}
	
	
}

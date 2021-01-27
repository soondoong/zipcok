package zipcok.notice.model;

public class ZipcokFileDTO {

	private int zfile_idx;
	private int bbs_idx;
	private String mem_id;
	private String bbs_key;
	private String zfile_upload;
	private int zfile_size;
	private String zfile_orig;
	private String zfile_path;
	private String zfile_type;
	public ZipcokFileDTO() {
		super();
	}
	public ZipcokFileDTO(int zfile_idx, int bbs_idx, String mem_id, String bbs_key, String zfile_upload, int zfile_size,
			String zfile_orig, String zfile_path, String zfile_type) {
		super();
		this.zfile_idx = zfile_idx;
		this.bbs_idx = bbs_idx;
		this.mem_id = mem_id;
		this.bbs_key = bbs_key;
		this.zfile_upload = zfile_upload;
		this.zfile_size = zfile_size;
		this.zfile_orig = zfile_orig;
		this.zfile_path = zfile_path;
		this.zfile_type = zfile_type;
	}
	public int getZfile_idx() {
		return zfile_idx;
	}
	public void setZfile_idx(int zfile_idx) {
		this.zfile_idx = zfile_idx;
	}
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBbs_key() {
		return bbs_key;
	}
	public void setBbs_key(String bbs_key) {
		this.bbs_key = bbs_key;
	}
	public String getZfile_upload() {
		return zfile_upload;
	}
	public void setZfile_upload(String zfile_upload) {
		this.zfile_upload = zfile_upload;
	}
	public int getZfile_size() {
		return zfile_size;
	}
	public void setZfile_size(int zfile_size) {
		this.zfile_size = zfile_size;
	}
	public String getZfile_orig() {
		return zfile_orig;
	}
	public void setZfile_orig(String zfile_orig) {
		this.zfile_orig = zfile_orig;
	}
	public String getZfile_path() {
		return zfile_path;
	}
	public void setZfile_path(String zfile_path) {
		this.zfile_path = zfile_path;
	}
	public String getZfile_type() {
		return zfile_type;
	}
	public void setZfile_type(String zfile_type) {
		this.zfile_type = zfile_type;
	}
	
}

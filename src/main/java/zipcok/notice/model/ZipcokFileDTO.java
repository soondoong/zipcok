package zipcok.notice.model;

public class ZipcokFileDTO {

	private int zfile_idx;
	private int zfile_bbs_idx;
	private String zfile_mem_id;
	private String zfile_bbs_key;
	private String zfile_upload;
	private int zfile_size;
	private String zfile_orig;
	private String zfile_path;
	private String zfile_type;
	private String del_yn;
	public ZipcokFileDTO() {
		super();
	}
	public ZipcokFileDTO(int zfile_idx, int zfile_bbs_idx, String zfile_mem_id, String zfile_bbs_key,
			String zfile_upload, int zfile_size, String zfile_orig, String zfile_path, String zfile_type,
			String del_yn) {
		super();
		this.zfile_idx = zfile_idx;
		this.zfile_bbs_idx = zfile_bbs_idx;
		this.zfile_mem_id = zfile_mem_id;
		this.zfile_bbs_key = zfile_bbs_key;
		this.zfile_upload = zfile_upload;
		this.zfile_size = zfile_size;
		this.zfile_orig = zfile_orig;
		this.zfile_path = zfile_path;
		this.zfile_type = zfile_type;
		this.del_yn = del_yn;
	}
	public int getZfile_idx() {
		return zfile_idx;
	}
	public void setZfile_idx(int zfile_idx) {
		this.zfile_idx = zfile_idx;
	}
	public int getZfile_bbs_idx() {
		return zfile_bbs_idx;
	}
	public void setZfile_bbs_idx(int zfile_bbs_idx) {
		this.zfile_bbs_idx = zfile_bbs_idx;
	}
	public String getZfile_mem_id() {
		return zfile_mem_id;
	}
	public void setZfile_mem_id(String zfile_mem_id) {
		this.zfile_mem_id = zfile_mem_id;
	}
	public String getZfile_bbs_key() {
		return zfile_bbs_key;
	}
	public void setZfile_bbs_key(String zfile_bbs_key) {
		this.zfile_bbs_key = zfile_bbs_key;
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
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public ZipcokFileDTO(int zfile_bbs_idx, String del_yn) {
		super();
		this.zfile_bbs_idx = zfile_bbs_idx;
		this.del_yn = del_yn;
	}
	
	
	
}

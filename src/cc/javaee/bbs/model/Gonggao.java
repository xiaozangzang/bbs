package cc.javaee.bbs.model;

public class Gonggao {
//	公告id
	private Integer id;
//	公告内容
	private String content;
//	创建人
	private Integer createuserid;
//	创建时间
	private String createtime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getCreateuserid() {
		return createuserid;
	}
	public void setCreateuserid(Integer createuserid) {
		this.createuserid = createuserid;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	@Override
	public String toString() {
		return "Gonggao [id=" + id + ", content=" + content
				+ ", createuserid=" + createuserid + ", createtime="
				+ createtime + "]";
	}

}

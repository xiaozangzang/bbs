package cc.javaee.bbs.model;

public class LiuYanHuifu {
	
	private Integer id;

	//留言的id
    private Integer liuyanid;

    //留言的创建时间
    private String createtime;

    //创建人id
    private Integer createuserid;

    //最后操作内容
    private String lastupdate;

    //是否删除
    private String isdel;

    //排序
    private Integer orderby;
    
    //html内容
    private String contenthtml;
    
    //纯文本内容
    private String contenttxt;
    
    private Integer huifuid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLiuyanid() {
		return liuyanid;
	}

	public void setLiuyanid(Integer liuyanid) {
		this.liuyanid = liuyanid;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public Integer getCreateuserid() {
		return createuserid;
	}

	public void setCreateuserid(Integer createuserid) {
		this.createuserid = createuserid;
	}

	public String getLastupdate() {
		return lastupdate;
	}

	public void setLastupdate(String lastupdate) {
		this.lastupdate = lastupdate;
	}

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}

	public Integer getOrderby() {
		return orderby;
	}

	public void setOrderby(Integer orderby) {
		this.orderby = orderby;
	}

	public String getContenthtml() {
		return contenthtml;
	}

	public void setContenthtml(String contenthtml) {
		this.contenthtml = contenthtml;
	}

	public String getContenttxt() {
		return contenttxt;
	}

	public void setContenttxt(String contenttxt) {
		this.contenttxt = contenttxt;
	}

	public Integer getHuifuid() {
		return huifuid;
	}

	public void setHuifuid(Integer huifuid) {
		this.huifuid = huifuid;
	}

	@Override
	public String toString() {
		return "LiuYanHuifu [id=" + id + ", liuyanid=" + liuyanid
				+ ", createtime=" + createtime + ", createuserid="
				+ createuserid + ", lastupdate=" + lastupdate + ", isdel="
				+ isdel + ", orderby=" + orderby + ", contenthtml="
				+ contenthtml + ", contenttxt=" + contenttxt + ", huifuid="
				+ huifuid + "]";
	}
    
    
}

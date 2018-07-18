package cc.javaee.bbs.model;
/*
 * 回复表
 * 
 */
public class Huifu {

	private Integer id;

	//帖子的id
    private Integer tieziid;

    //帖子的创建时间
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
    
    

	public Integer getHuifuid() {
		return huifuid;
	}

	public void setHuifuid(Integer huifuid) {
		this.huifuid = huifuid;
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTieziid() {
        return tieziid;
    }

    public void setTieziid(Integer tieziid) {
        this.tieziid = tieziid;
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
}
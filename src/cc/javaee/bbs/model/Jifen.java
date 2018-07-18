package cc.javaee.bbs.model;

public class Jifen {
    private Integer id;

    //积分内容
    private String content;

    //积分类型  101发帖，102回复 103精华  104登录  
    private String type;

    //创建时间
    private String createtime;

    //分数
    private Integer fenshu;

    //用户id
    private Integer userid;

    //操作人id
    private Integer operateuserid;
    
    
    private String starttime;
    
    private String endtime;
    
    public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public Integer getOperateuserid() {
		return operateuserid;
	}

	public void setOperateuserid(Integer operateuserid) {
		this.operateuserid = operateuserid;
	}

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
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
    public Integer getFenshu() {
        return fenshu;
    }

    public void setFenshu(Integer fenshu) {
        this.fenshu = fenshu;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}
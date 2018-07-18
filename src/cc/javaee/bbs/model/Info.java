package cc.javaee.bbs.model;
/*
 * 网站信息表
 * 
 */
public class Info {
	
    private Integer id;

    //网站名称
    private String name;
    //首页标题
    private String indextitle;
    //网站关键字
    private String keywords;
    //网站描述
    private String description;
    //logo
    private String logoimg;
    //底部html
    private String foothtml;
    
    
	public String getIndextitle() {
		return indextitle;
	}
	public void setIndextitle(String indextitle) {
		this.indextitle = indextitle;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLogoimg() {
		return logoimg;
	}
	public void setLogoimg(String logoimg) {
		this.logoimg = logoimg;
	}
	public String getFoothtml() {
		return foothtml;
	}
	public void setFoothtml(String foothtml) {
		this.foothtml = foothtml;
	}
}
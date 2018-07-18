package cc.javaee.bbs.model;

import java.util.List;

/*
 * 分页bean
 * 
 * 
 */
public class PageBean<T> {

	//总条数
	private int totalRecords;

	//总页数
	private int totalPages;

	//查询的bean
	private List<T> list;

	//mysql的开始条数
	private int pageNo = 0;
	
	//开始页面
	private int pagestart = 1;

	//页面
	private int pageSize = 10;

	private T bean;

	public T getBean() {
		return bean;
	}

	public void setBean(T bean) {
		this.bean = bean;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getPageNo() {
		return pageSize*(pagestart-1);
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getTotalPages() {
		return (totalRecords + pageSize - 1) / pageSize;
	}

	public int getPagestart() {
		return pagestart;
	}

	public void setPagestart(int pagestart) {
		this.pagestart = pagestart;
	}
	
}
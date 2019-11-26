package com.wlfei.util;

public class Pager {
	private int page;  // 页码
	private int limit; // 每页条数
	private int total;  // 总条数
	private String param;  // 参数

	private static final int defaultLimit = 5;

	public boolean isHasPreviouse() {
		if (page == 0) {
			return false;

		}
		return true;
	}

	public boolean isHasNext() {
		if (page == getLast()) {
			return false;
		}
		return true;
	}

	public int getTotalPage() {
		int totalPage;
		if (0 == total % limit) {
			totalPage = total / limit;
		} else {
			totalPage = total / limit + 1;

		}
		if (0 == totalPage) {
			totalPage = 1;
		}
		return totalPage;
	}

	public int getLast() {
		int last;
		if (0 == total % limit) {
			last = total - limit;
		} else {
			last = total - total % limit;
		}
		last = last < 0 ? 0 : last;
		return last;
	}


	@Override
	public String toString() {
		return "Pager [page=" + page + ", limit=" + limit + ", total=" + total + ", param=" + param + "]";
	}

	public Pager() {
		super();
		this.limit = defaultLimit;
	}


	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

}

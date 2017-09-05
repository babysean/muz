package spring.muz.dao;

import java.util.HashMap;
import java.util.List;

import spring.muz.bean.DefaultBean;

public interface Dao {
	public List<DefaultBean> paging(HashMap<Object, Object> map);
}

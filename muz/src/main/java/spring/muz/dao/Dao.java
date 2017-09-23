package spring.muz.dao;

import java.util.HashMap;
import java.util.List;

public interface Dao {
	public List<?> paging(HashMap<Object, Object> map);
}


package spring.muz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.muz.bean.MuzBean;

@Component(value = "muzDao")
public class MuzDao extends SqlSessionDaoSupport implements Dao{
	
	@Override
	public List<?> paging(HashMap<Object, Object> map) {
		return null;
	}
	
	/* 회원가입 */
	public void insertMuz(MuzBean muz) {
		this.getSqlSession().insert("insertMuz",muz);
	}
	
	/* 로그인 */
	public MuzBean loginProcess(String id, String pw) {
		MuzBean muz = this.getSqlSession().selectOne("loginProcess", id);
		if(pw.equals(muz.getPw())) {
			return muz;
		} else {
			return null;
		}
	}
}
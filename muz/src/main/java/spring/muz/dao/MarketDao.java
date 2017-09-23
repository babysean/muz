package spring.muz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.muz.bean.MarketBean;

@Component(value = "marketDao")
public class MarketDao extends SqlSessionDaoSupport implements Dao{
	
	@Override
	public List<?> paging(HashMap<Object, Object> map) {
		return null;
	}
	
	/* 모든 뮤즈장터 상품 가져오기 */
	public List<MarketBean> selectMarket() {
		return this.getSqlSession().selectList("selectMarket");
	}
	
	/* 뮤즈장터에 상품 등록하기 */
	public void insertMarket(MarketBean market) {
		this.getSqlSession().insert("insertMarket", market);
	}
	
	/* 메인페이지에 뿌려줄 3개의 최신 뮤즈장터가져오기 */
	public List<MarketBean> mainPageMarket() {
		return this.getSqlSession().selectList("mainPageMarket");
	}
}
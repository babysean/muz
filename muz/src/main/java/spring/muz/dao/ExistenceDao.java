package spring.muz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.muz.bean.BoardBean;
import spring.muz.bean.DefaultBean;
import spring.muz.bean.ExistenceBean;

@Component(value = "existenceDao")
public class ExistenceDao extends SqlSessionDaoSupport implements Dao{
	
	/* existence 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectExistence", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* 메인페이지에 뿌려줄 3개의 최신 자작곡가져오기 */
	public List<ExistenceBean> mainPageExistence() {
		return this.getSqlSession().selectList("mainPageExistence");
	}
	
	/* existence 테이블 총 행 가져오기 */
	public int getExistenceTotalRow() {
		return this.getSqlSession().selectOne("getExistenceTotalRow");
	}
	
	/* 자작곡 등록 */
	public void insertExistence(ExistenceBean existence) {
		this.getSqlSession().insert("insertExistence", existence);
	}
	
	/* 자작곡 1개 정보 가져오기 */
	public ExistenceBean selectOneExistence(int no) {
		this.getSqlSession().update("updateExistenceHit", no);
		return this.getSqlSession().selectOne("selectOneExistence", no);
	}
	
	/* 해당 번호 자작곡에 좋아요를 누른 사람 가져오기 */
	public String selectExistenceLikePeople(int no) {
		return this.getSqlSession().selectOne("selectExistenceLikePeople", no);
	}
	
	/* 해당 번호 자작곡에 싫어요를 누른 사람 가져오기 */
	public String selectExistenceUnLikePeople(int no) {
		return this.getSqlSession().selectOne("selectExistenceUnLikePeople", no);
	}
	
	/* 해당 번호 자작곡에 좋아요 프로세스 */
	public void updateExistenceLikeProcess(HashMap<Object, Object> map) {
		this.getSqlSession().update("updateExistenceLikeProcess", map);
	}
	
	/* 해당 번호 자작곡에 좋아요 취소 프로세스 */
	public void updateExistenceLikeCancelProcess(HashMap<Object, Object> map) {
		this.getSqlSession().update("updateExistenceLikeCancelProcess", map);
	}
	
	/* 해당 번호 자작곡에 싫어요 프로세스 */
	public void updateExistenceUnLikeProcess(HashMap<Object, Object> map) {
		this.getSqlSession().update("updateExistenceUnLikeProcess", map);
	}
	
	/* 해당 번호 자작곡에 싫어요 취소 프로세스 */
	public void updateExistenceUnLikeCancelProcess(HashMap<Object, Object> map) {
		this.getSqlSession().update("updateExistenceUnLikeCancelProcess", map);
	}
}
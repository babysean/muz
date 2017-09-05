package spring.muz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.muz.bean.BoardBean;
import spring.muz.bean.DefaultBean;

@Component(value = "boardDao")
public class BoardDao extends SqlSessionDaoSupport implements Dao{
	
	/* board 테이블 paging 후 가져오기 */
	@Override
	public List<DefaultBean> paging(HashMap<Object, Object> map) {
		try {
			return this.getSqlSession().selectList("selectBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* board 테이블 총 행 가져오기 */
	public int getBoardTotalRow() {
		return this.getSqlSession().selectOne("getBoardTotalRow");
	}
	
	/* board insert */
	public void insertBoard(BoardBean board) {
		this.getSqlSession().insert("insertBoard", board);
	}
	
	/* board 정보 1개 가져오기 */
	public BoardBean selectOneBoard(int no) {
		this.getSqlSession().update("updateBoardHit", no);
		return this.getSqlSession().selectOne("selectOneBoard", no);
	}
	
	/* 게시판 좋아요 */
	public void boardLikeClick(HashMap<Object, Object> map) {
		this.getSqlSession().update("boardLikeClick", map);
	}
	
	/* 게시판 좋아요 취소 */
	public void boardUnlikeClick(HashMap<Object, Object> map) {
		this.getSqlSession().update("boardUnlikeClick", map);
	}
	
	/* 해당 번호 게시판의 좋아요를 누른 사람 가져오기 */
	public String selectLikePeople(int no) {
		return this.getSqlSession().selectOne("selectLikePeople", no);
	}
	
	/* 메인페이지에 뿌려줄 3개의 최신 게시판가져오기 */
	public List<BoardBean> mainPageBoard() {
		return this.getSqlSession().selectList("mainPageBoard");
	}
	
	
}
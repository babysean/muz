package spring.muz.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.muz.bean.BoardReplyBean;

@Component(value = "boardReplyDao")
public class BoardReplyDao extends SqlSessionDaoSupport{
	/* 해당 게시판 댓글 가져오기 */
	public List<BoardReplyBean> selectAllBoardReply(int no) {
		return this.getSqlSession().selectList("selectAllBoardReply", no);
	}
	
	/* 게시판 댓글 등록하기 */
	public void insertBoardReply(BoardReplyBean boardReply) {
		this.getSqlSession().insert("insertBoardReply", boardReply);
	}
}
package spring.muz.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import spring.muz.bean.ExistenceReplyBean;

@Component(value = "existenceReplyDao")
public class ExistenceReplyDao extends SqlSessionDaoSupport{
	/* 해당 게시판 댓글 가져오기 */
	public List<ExistenceReplyBean> selectAllExistenceReply(int no) {
		return this.getSqlSession().selectList("selectAllExistenceReply", no);
	}
	
	public void insertExistenceReply(ExistenceReplyBean existence) {
		this.getSqlSession().insert("insertExistenceReply", existence);
	}
}
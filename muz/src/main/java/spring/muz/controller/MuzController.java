package spring.muz.controller;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.muz.bean.BoardBean;
import spring.muz.bean.BoardReplyBean;
import spring.muz.bean.ExistenceBean;
import spring.muz.bean.ExistenceReplyBean;
import spring.muz.bean.MarketBean;
import spring.muz.bean.MuzBean;
import spring.muz.bean.PageBean;
import spring.muz.dao.BoardDao;
import spring.muz.dao.BoardReplyDao;
import spring.muz.dao.Dao;
import spring.muz.dao.ExistenceDao;
import spring.muz.dao.ExistenceReplyDao;
import spring.muz.dao.MarketDao;
import spring.muz.dao.MuzDao;

@Controller
public class MuzController {
	
	@Resource(name = "muzDao")
	private MuzDao muzDao;
	@Resource(name = "boardDao")
	private BoardDao boardDao;
	@Resource(name = "boardReplyDao")
	private BoardReplyDao boardReplyDao;
	@Resource(name = "existenceDao")
	private ExistenceDao existenceDao;
	@Resource(name = "existenceReplyDao")
	private ExistenceReplyDao existenceReplyDao;
	@Resource(name = "marketDao")
	private MarketDao marketDao;
	
	/* paging */
	public void paging(Dao dao ,int total, int pages, String mode, ModelAndView mav) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		// 현재 페이지
		int currentPage = 0;
		// 한 페이지에 출력할 행의 갯수
		int pageScale = 10;
		// 총 데이터 행의 갯수
		int totalRow = 0;
		
		try {
			totalRow = total;
			currentPage = pages;
		} catch (Exception e) {
			currentPage = 1;
		}
		
		// 총 페이지 수
		int totalPage = totalRow % pageScale == 0 ? totalRow / pageScale : totalRow / pageScale + 1;
		if (totalRow == 0)
			totalPage = 1;
		
		// 페이지의 첫 데이터 번호
		int start = 1 + (currentPage - 1) * pageScale;
		// 페이지의 마지막 데이터 번호
		int end = pageScale + (currentPage - 1) * pageScale;

		// 현재 블락
		int currentBlock = currentPage % pageScale == 0 ? (currentPage / pageScale) : (currentPage / pageScale) + 1;
		// 시작 페이지
		int startPage = 1 + (currentBlock - 1) * pageScale;
		// 마지막 페이지
		int endPage = pageScale + (currentBlock - 1) * pageScale;
		if (totalPage <= endPage)
			endPage = totalPage;
		
		map.put("start", start);
		map.put("end", end);
		
		if(mode!=null) {
			map.put("mode", mode);
		}
		
		mav.addObject("list", dao.paging(map));
		mav.addObject("pageBean", new PageBean(currentPage, totalPage, startPage, endPage, currentBlock));
	}
	
	/* 텍스트 띄어쓰기, 개행 문자로 바꿔주기 */
	public String changeDbContents(String contents) {
		// 개행
		contents = contents.replaceAll("\r\n","<br>");
		// 띄어쓰기
		contents = contents.replaceAll(" ","&nbsp;");
		return contents;
	}
	
	/* 해당 번호 게시판의 좋아요를 누른 사람중 id와 같은 사람이 있는지 검사 */
	public boolean searchLikePeople(String temp, String id) {
		String[] likePeople= temp.split("/");
		for(int i=0 ; i<likePeople.length ; i++) {
			if(likePeople[i].equals(id)) {
				return false;
			}
		}
		return true;
	}
	
	/* 해당 번호 게시판의 좋아요를 누른 id 삭제 */
	public String deleteLikePeople(String temp, String id) {
		String likepeople = temp.replaceAll("/"+id, "");
		return likepeople;
	}
	
	/* home.jsp 로 이동 */
	@RequestMapping(value = "index.do")
	public ModelAndView indexAction() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mainPageBoard", boardDao.mainPageBoard());
		mav.addObject("mainPageExistence", existenceDao.mainPageExistence());
		mav.addObject("mainPageMarket", marketDao.mainPageMarket());
		mav.setViewName("views/home");
		return mav;
	}
	
	/* 회원가입 페이지로 이동 */
	@RequestMapping(value = "signUp.do")
	public ModelAndView signUpAction() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/signUp");
		return mav;
	}
	
	/* 자유게시판 페이지로 이동 */
	@RequestMapping(value = "board.do")
	public ModelAndView boardAction(@RequestParam(value="pages")int pages) {
		ModelAndView mav = new ModelAndView();
		paging(boardDao, boardDao.getBoardTotalRow(), pages, null, mav);
		mav.addObject("mode", "board.do");
		mav.setViewName("views/board");
		return mav;
	}
	
	/* 자유게시판 글쓰기 페이지로 이동 */
	@RequestMapping(value = "boardEdit.do")
	public ModelAndView boardEditAction() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/board/boardEdit");
		return mav;
	}
	
	/* 자유게시판 글쓰기 프로세스 */
	@RequestMapping(value = "boardEditProcess.do")
	public ModelAndView boardEditProcess(@ModelAttribute("board")BoardBean board) {
		ModelAndView mav = new ModelAndView();
		// 개행, 띄어쓰기
		board.setContents(changeDbContents(board.getContents()));
		boardDao.insertBoard(board);
		mav.setViewName("redirect:board.do?pages=1");
		return mav;
	}
	
	/* 자유게시판 상세정보 페이지로 이동 */
	@RequestMapping(value = "boardDetail.do")
	public ModelAndView boardDetailAction(@RequestParam("no")int no, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/board/boardDetail");
		mav.addObject("detail", boardDao.selectOneBoard(no));
		mav.addObject("boardReplyList", boardReplyDao.selectAllBoardReply(no));
		mav.addObject("likePossible", searchLikePeople(boardDao.selectLikePeople(no), id));
		return mav;
	}
	
	/* 자유게시판 좋아요 프로세스 */
	@RequestMapping(value = "likes.do")
	public ModelAndView likesAction(@RequestParam("no")int no, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("id", id);
		boardDao.boardLikeClick(map);
		mav.setViewName("redirect:boardDetail.do?no="+no+"&id="+id);
		return mav;
	}
	
	/* 자유게시판 좋아요 취소 프로세스 */
	@RequestMapping(value = "unLikes.do")
	public ModelAndView UnlikesAction(@RequestParam("no")int no, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("people", deleteLikePeople(boardDao.selectLikePeople(no), id));
		boardDao.boardUnlikeClick(map);
		mav.setViewName("redirect:boardDetail.do?no="+no+"&id="+id);
		return mav;
	}
	
	/* 자유게시판 댓글 등록하기 */
	@RequestMapping(value = "boardReplyInsert.do")
	public ModelAndView boardReplyProcess(@ModelAttribute("boardReply")BoardReplyBean boardReply, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		boardReply.setContents(changeDbContents(boardReply.getContents()));
		boardReplyDao.insertBoardReply(boardReply);
		mav.setViewName("redirect:boardDetail.do?no="+boardReply.getPnum()+"&id="+id);
		return mav;
	}
	
	/* 자작곡 페이지로 이동 */
	@RequestMapping(value = "self-Existence.do")
	public ModelAndView selfExistenceAction(@RequestParam("pages")int pages) {
		ModelAndView mav = new ModelAndView();
		paging(existenceDao, existenceDao.getExistenceTotalRow(), pages, null, mav);
		mav.setViewName("views/self-Existence");
		return mav;
	}
	
	/* 자작곡 등록 페이지로 이동 */
	@RequestMapping(value = "existenceEdit.do")
	public ModelAndView existenceEditAction() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/existence/existenceEdit");
		return mav;
	}
	
	/* 자작곡 등록 프로세스 */
	@RequestMapping(value = "existenceEditProcess.do")
	public ModelAndView existenceEditProcess(@ModelAttribute("existence")ExistenceBean existence) {
		ModelAndView mav = new ModelAndView();
		existence.setContents(changeDbContents(existence.getContents()));
		existenceDao.insertExistence(existence);
		mav.setViewName("redirect:self-Existence.do?pages=1");
		return mav;
	}
	
	/* 자작곡 상세 정보 */
	@RequestMapping(value = "existenceDetail.do")
	public ModelAndView existenceDetailAction(@RequestParam("no")int no, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("detail", existenceDao.selectOneExistence(no));
		mav.addObject("existenceReplyList", existenceReplyDao.selectAllExistenceReply(no));
		mav.addObject("likePossible", searchLikePeople(existenceDao.selectExistenceLikePeople(no), id));
		mav.addObject("unLikePossible", searchLikePeople(existenceDao.selectExistenceUnLikePeople(no), id));
		mav.setViewName("views/existence/existenceDetail");
		return mav;
	}
	
	/* 자작곡 댓글 등록 프로세스 */
	@RequestMapping(value = "existenceReplyProcess.do")
	public ModelAndView existenceReplyProcess(@ModelAttribute("existenceReply")ExistenceReplyBean existenceReply, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		existenceReplyDao.insertExistenceReply(existenceReply);
		mav.setViewName("redirect:existenceDetail.do?no="+existenceReply.getPnum()+"&id="+id);
		return mav;
	}
	
	/* 자작곡 좋아요 프로세스 */
	@RequestMapping(value = "existenceLike.do")
	public ModelAndView existenceLikeProcess(@RequestParam("no")int no, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("id", id);
		existenceDao.updateExistenceLikeProcess(map);
		mav.setViewName("redirect:existenceDetail.do?no="+no+"&id="+id);
		return mav;
	}
	
	/* 자작곡 좋아요 취소 프로세스 */
	@RequestMapping(value = "existenceLikeCancel.do")
	public ModelAndView existenceLikeCancelProcess(@RequestParam("no")int no, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("people", deleteLikePeople(existenceDao.selectExistenceLikePeople(no), id));
		existenceDao.updateExistenceLikeCancelProcess(map);
		mav.setViewName("redirect:existenceDetail.do?no="+no+"&id="+id);
		return mav;
	}
	
	/* 자작곡 싫어요 프로세스 */
	@RequestMapping(value = "existenceUnLike.do")
	public ModelAndView existenceUnLikeProcess(@RequestParam("no")int no, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("id", id);
		existenceDao.updateExistenceUnLikeProcess(map);
		mav.setViewName("redirect:existenceDetail.do?no="+no+"&id="+id);
		return mav;
	}
	
	/* 자작곡 싫어요 취소 프로세스 */
	@RequestMapping(value = "existenceUnLikeCancel.do")
	public ModelAndView existenceUnLikeCancelProcess(@RequestParam("no")int no, @RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("people", deleteLikePeople(existenceDao.selectExistenceUnLikePeople(no), id));
		existenceDao.updateExistenceUnLikeCancelProcess(map);
		mav.setViewName("redirect:existenceDetail.do?no="+no+"&id="+id);
		return mav;
	}
	
	/* 중고장터 페이지로 이동 */
	@RequestMapping(value = "market.do")
	public ModelAndView marketAction() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("marketList", marketDao.selectMarket());
		mav.setViewName("views/market");
		return mav;
	}
	
	/* 중고장터 상품등록 페이지로 이동 */
	@RequestMapping(value = "marketEdit.do")
	public ModelAndView marketEditAction() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/market/marketEdit");
		return mav;
	}
	
	/* 중고장터 상품등록 프로세스 */
	@RequestMapping(value = "marketEditProcess.do")
	public ModelAndView marketEditProcess(MultipartHttpServletRequest request) {
		// 프로젝트의 root 경로
		String rootPath = "/Users/babysean/Documents/muz/muz/src/main/webapp/img/market/";
		String projectPath = "/controller/img/market/";
		// 상품등록 정보 MultipartHttpServletRequest로 받아오기
		String writer = request.getParameter("writer");
		String tel = request.getParameter("tel");
		int price = Integer.parseInt(request.getParameter("price"));
		String location = request.getParameter("location");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		MultipartFile picture = request.getFile("picture");
		
		MarketBean market = new MarketBean(0, title, writer, contents, tel, price, location, 0, " ", projectPath+picture.getOriginalFilename(), " ");
		
		File file = new File(rootPath+picture.getOriginalFilename());
		try {
			picture.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		marketDao.insertMarket(market);
		mav.setViewName("redirect:market.do");
		return mav;
	}
	
	/* 회원가입 Process */
	@RequestMapping(value = "signUpProcess.do", method = RequestMethod.POST)
	public ModelAndView signupProcess(MultipartHttpServletRequest request) {
		// 프로젝트의 root 경로
		String rootPath = "/Users/babysean/Documents/muz/muz/src/main/webapp/img/muzPicture/";
		String projectPath = "/controller/img/muzPicture/";
		// 회원가입 정보 MultipartHttpServletRequest로 받아오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String tel = request.getParameter("tel");
		MultipartFile picture = request.getFile("picture");
		
		MuzBean muz = new MuzBean(id, pw, name, nickname, tel, projectPath+picture.getOriginalFilename());
		
		File file = new File(rootPath+picture.getOriginalFilename());
		try {
			picture.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		muzDao.insertMuz(muz);
		mav.setViewName("redirect:index.do");
		return mav;
	}
	
	/* 로그인 Process */
	@RequestMapping(value = "loginProcess.do")
	public ModelAndView loginProcess(@RequestParam("id")String id, @RequestParam("pw")String pw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MuzBean muz = muzDao.loginProcess(id, pw);
		if(muz!=null) {
			session.setAttribute("user", muz);
		}
		mav.setViewName("redirect:index.do");
		return mav;
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "logout.do")
	public ModelAndView logoutProcess(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:index.do");
		return mav;
	}
	
}

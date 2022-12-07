package org.hdcd.controller.reviewboard.web;

import java.util.List; 

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.hdcd.controller.reviewboard.service.IReviewBoardService;
import org.hdcd.controller.vo.PaginationInfoVO;
import org.hdcd.controller.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review")
public class ReviewBoardRetrieveController {
	
	@Inject
	private IReviewBoardService reviewService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView noticeListView(
			@RequestParam(name = "page", required = false, defaultValue= "1") int currentPage, 
			@RequestParam(required = false, defaultValue = "title") String searchType, 
			@RequestParam(required = false) String searchWord
			) {
		
		System.out.println("검색어 체크" + searchWord);
		System.out.println("검색타입 체크" + searchType);
		
		
		ModelAndView mav = new ModelAndView();
		PaginationInfoVO<ReviewVO> pagingVO = new PaginationInfoVO<>(); 
		
		if(StringUtils.isNotBlank(searchWord)) {
			if("title".equals(searchType)) {
				pagingVO.setSearchType("title");  // 제목으로 검색 
			}else {
				pagingVO.setSearchType("writer");  // 작성자로 검색 
			}
			pagingVO.setSearchWord(searchWord);   
			mav.addObject("searchType",searchType);
			mav.addObject("searchWord",searchWord);
			
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = reviewService.selectReviewCount(pagingVO);  // 전체 게시물 수  
		
		pagingVO.setTotalRecord(totalRecord);
		List<ReviewVO> dataList = reviewService.selectReviewList(pagingVO); 
		
		pagingVO.setDataList(dataList);
		
		mav.addObject("pagingVO",pagingVO);  
		mav.setViewName("review/list");
		return mav;
	}
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String showDetail(int reNo, ModelMap model) {
		ReviewVO reviewVO = reviewService.selectReview(reNo);
		model.addAttribute("reviewVO",reviewVO); 
		return "review/detail";
	}
	
	
	
	
	
	
}

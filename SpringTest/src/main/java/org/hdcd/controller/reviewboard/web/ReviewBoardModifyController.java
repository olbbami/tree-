package org.hdcd.controller.reviewboard.web;

import javax.inject.Inject;

import org.hdcd.controller.ServiceResult;
import org.hdcd.controller.reviewboard.service.IReviewBoardService;
import org.hdcd.controller.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/review")
public class ReviewBoardModifyController {
	
	@Inject
	private IReviewBoardService reviewService; 
	
	
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String reviewUpdateView(int reNo, ModelMap model) {
		ReviewVO reviewVO = reviewService.selectReview(reNo); 
		model.addAttribute("review",reviewVO);  
		model.addAttribute("status", "u");  
		return "review/form"; 
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String reviewUpdate(ReviewVO reviewVO, ModelMap model) {
		String goPage = ""; 
		ServiceResult result = reviewService.updateReview(reviewVO); 
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/review/detail.do?reNo="+reviewVO.getReNo();
		}else {
			model.addAttribute("message","수정에 실패하였습니다."); 
			model.addAttribute("reviewVO", reviewVO); 
			goPage = "review/form";
		}
		return goPage; 
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String reviewDelete(int reNo, ModelMap model) {
		String goPage = "";
		ServiceResult result = reviewService.deleteReview(reNo);
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/review/list.do"; 
		}else {
			model.addAttribute("message", "서버오류, 다시 시도해주세요");
			goPage = "redirect:/review/detail.do?reNo="+reNo;
		}
		return goPage;
		
	}
	
}

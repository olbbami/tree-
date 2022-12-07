package org.hdcd.controller.reviewboard.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.hdcd.controller.ServiceResult;
import org.hdcd.controller.reviewboard.service.IReviewBoardService;
import org.hdcd.controller.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/review")
public class ReviewBoardInsertController {
	@Inject
	private IReviewBoardService reviewService; 
	
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String reviewFormView() {
		return "review/form";
	}
	
	
//	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
//	public String reviewInsert(ReviewVO reviewVO, ModelMap model) {
////		String goPage = ""; 
////		Map<String, String> errors = new HashMap<>();
////		
////		if(StringUtils.isBlank(reviewVO.getReTitle())) {
////			errors.put("reTitle", "제목을 입력해주세요.");
////		}
////		if(StringUtils.isBlank(reviewVO.getReContent())) {
////			errors.put("reContent", "내용을 입력해주세요");
////		}
////		
////		if(errors.size() > 0) {  // 에러가 있음
////			model.addAttribute("errors",errors);
////			model.addAttribute("reviewVO",reviewVO);
////			goPage = "review/form";
////		}else { // 정상 
////			reviewVO.setReWriter("a001");
////			ServiceResult result = reviewService.insertReview(reviewVO);
////			if(result.equals(ServiceResult.OK)) {
////				goPage = "redirect:/review/list.do";
////			}else {
////				model.addAttribute("message","서버에러, 다시 시도해주세요!");
////				goPage = "review/form";
////			}
////		}
////		
////		return goPage;
////	}
}

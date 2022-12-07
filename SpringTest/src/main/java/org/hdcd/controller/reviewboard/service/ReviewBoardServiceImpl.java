package org.hdcd.controller.reviewboard.service;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.controller.ServiceResult;
import org.hdcd.controller.vo.PaginationInfoVO;
import org.hdcd.controller.vo.ReviewVO;
import org.hdcd.mapper.ReviewMapper;
import org.springframework.stereotype.Service;

@Service
public class ReviewBoardServiceImpl implements IReviewBoardService {
	
	@Inject
	ReviewMapper reviewMapper;
	
	@Override
	public int selectReviewCount(PaginationInfoVO<ReviewVO> pagingVO) {
		return reviewMapper.selectReviewCount(pagingVO);
	}

	@Override
	public List<ReviewVO> selectReviewList(PaginationInfoVO<ReviewVO> pagingVO) {
		return reviewMapper.selectReviewList(pagingVO);
	}

	@Override
	public ReviewVO selectReview(int reNo) {
		return reviewMapper.selectReview(reNo);
	}

	@Override
	public ServiceResult updateReview(ReviewVO reviewVO) {
		ServiceResult result = null; 
		int cnt = reviewMapper.updateReview(reviewVO); 
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED; 
		}
		return result; 
	}

	@Override
	public ServiceResult deleteReview(int reNo) {
		ServiceResult result = null; 
		int cnt = reviewMapper.deleteReview(reNo); 
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED; 
		}
		return result; 
	}

//	@Override
//	public ServiceResult insertReview(ReviewVO reviewVO) {
//		ServiceResult result = null; 
//		int cnt = reviewMapper.insertReview(reviewVO); 
//		if(cnt > 0) {
//			result = ServiceResult.OK;
//		}else {
//			result = ServiceResult.FAILED; 
//		}
//		return result; 
//		
//		
//	}

}

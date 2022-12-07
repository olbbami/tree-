package org.hdcd.controller.reviewboard.service;

import java.util.List;

import org.hdcd.controller.ServiceResult;
import org.hdcd.controller.vo.PaginationInfoVO;
import org.hdcd.controller.vo.ReviewVO;

public interface IReviewBoardService {

	int selectReviewCount(PaginationInfoVO<ReviewVO> pagingVO);

	List<ReviewVO> selectReviewList(PaginationInfoVO<ReviewVO> pagingVO);

	ReviewVO selectReview(int reNo);

	ServiceResult updateReview(ReviewVO reviewVO);

	ServiceResult deleteReview(int reNo);

//	ServiceResult insertReview(ReviewVO reviewVO);

}

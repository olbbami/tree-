package org.hdcd.mapper;

import java.util.List;

import org.hdcd.controller.ServiceResult;
import org.hdcd.controller.vo.PaginationInfoVO;
import org.hdcd.controller.vo.ReviewVO;

public interface ReviewMapper {

	int selectReviewCount(PaginationInfoVO<ReviewVO> pagingVO);

	List<ReviewVO> selectReviewList(PaginationInfoVO<ReviewVO> pagingVO);

	ReviewVO selectReview(int reNo);

	int updateReview(ReviewVO reviewVO);

	int deleteReview(int reNo);

//	int insertReview(ReviewVO reviewVO);
	
	
}

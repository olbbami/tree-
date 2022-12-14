package org.hdcd.controller.tree.service;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.controller.vo.TreeNode;
import org.hdcd.mapper.TreeMapper;
import org.springframework.stereotype.Service;

@Service
public class TreeServiceImpl implements ITreeService {
	
	@Inject
	TreeMapper mapper; 
	
	@Override
	public List<TreeNode> selectDatas() {
		return mapper.selectDatas();
	}

	@Override
	public List<TreeNode> selectEmpDatas() {
		return mapper.selectEmpDatas();
	}

}

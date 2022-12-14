package org.hdcd.controller.tree.service;

import java.util.List;

import org.hdcd.controller.vo.TreeNode;

public interface ITreeService {
	
	public List<TreeNode> selectDatas();

	public List<TreeNode> selectEmpDatas();

}

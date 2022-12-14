package org.hdcd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.controller.vo.TreeNode;

@Mapper
public interface TreeMapper {
	public List<TreeNode> selectDatas();

	public List<TreeNode> selectEmpDatas();

	public TreeNode selectEmpData(String empId);
}

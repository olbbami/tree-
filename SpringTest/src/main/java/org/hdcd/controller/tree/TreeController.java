package org.hdcd.controller.tree;

import java.util.ArrayList; 
import java.util.List;

import javax.inject.Inject;

import org.hdcd.controller.tree.service.ITreeService;
import org.hdcd.controller.vo.TreeNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TreeController {
	
	@Inject
	ITreeService service;
	
	
	@RequestMapping(value = "/treeTest1", method = RequestMethod.GET)
	public String showTree() {
		return "treeTest/treeTest1";
	}

	@RequestMapping(value = "/treeTest2", method = RequestMethod.GET)
	public String showTree2() {
		return "treeTest/treeTest2";
	}

	@RequestMapping(value = "/treeTest4", method = RequestMethod.GET)
	public String showTree4() {
		return "treeTest/treeTest4";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getTreeData", method = RequestMethod.POST)
	public TreeNode getNodeData(@RequestBody TreeNode node) {
		return node; 
	}
	
	@RequestMapping(value = "/clickTest", method = RequestMethod.GET)
	public String clickTest() {
		return "treeTest/click_Test";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getData", method =RequestMethod.GET)
	public List<TreeNode> getData() {
		List<TreeNode> joined = new ArrayList<TreeNode>();
		List<TreeNode> list1 = service.selectDatas();
		List<TreeNode> list2 = service.selectEmpDatas();
		
		
		joined.addAll(list1);
		joined.addAll(list2);
		
		
		return joined;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getEmpData", method = RequestMethod.POST)
	public TreeNode getEmpData(@RequestBody TreeNode node){
		String empId = node.getEmpId();
		
		return service.selectEmpData(empId);
		
	}
	
	
	
}

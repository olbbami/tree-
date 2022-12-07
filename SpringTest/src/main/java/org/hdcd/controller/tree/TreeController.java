package org.hdcd.controller.tree;

import java.util.ArrayList; 
import java.util.List;

import org.hdcd.controller.vo.TreeNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TreeController {
	
	@RequestMapping(value = "/treeTest1", method = RequestMethod.GET)
	public String showTree() {
		return "treeTest/treeTest1";
	}

	@RequestMapping(value = "/treeTest2", method = RequestMethod.GET)
	public String showTree2() {
		return "treeTest/treeTest2";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getData", method =RequestMethod.GET)
	public List<TreeNode> getData() {
		TreeNode node1 = new TreeNode();
		node1.setCodeId("a001");
		node1.setCodeLvl(1);
		node1.setCodeNm("파일1");
		
		TreeNode node2 = new TreeNode();
		node2.setCodeId("b001");
		node2.setCodeLvl(2);
		node2.setCodeNm("파일2");
		node2.setParentId("a001");
		
		TreeNode node3 = new TreeNode();
		node3.setCodeId("c001");
		node3.setCodeLvl(3);
		node3.setCodeNm("파일3");
		node3.setParentId("b001");
		
		TreeNode node4 = new TreeNode();
		node4.setCodeId("d001");
		node4.setCodeLvl(3);
		node4.setCodeNm("파일4");
		node4.setParentId("c001");
	
		TreeNode node5 = new TreeNode();
		node5.setCodeId("e001");
		node5.setCodeLvl(3);
		node5.setCodeNm("파일5");
		node5.setParentId("b001");
	
		
		List<TreeNode> list = new ArrayList();
		list.add(node1);
		list.add(node2);
		list.add(node3);
		list.add(node4);
		list.add(node5);
		
		return list;
	}
	
	
	
}

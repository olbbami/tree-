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
		
		TreeNode node6= new TreeNode();
		node6.setCodeId("f001");
		node6.setCodeLvl(3);
		node6.setCodeNm("파일6");
		node6.setParentId("b001");
		
		TreeNode node7 = new TreeNode();
		node7.setCodeId("g001");
		node7.setCodeLvl(3);
		node7.setCodeNm("파일7");
		node7.setParentId("b001");
		
		TreeNode node8 = new TreeNode();
		node8.setCodeId("h001");
		node8.setCodeLvl(3);
		node8.setCodeNm("파일8");
		node8.setParentId("c001");
		
		TreeNode node9 = new TreeNode();
		node9.setCodeId("i001");
		node9.setCodeLvl(3);
		node9.setCodeNm("파일9");
		node9.setParentId("c001");
		
		TreeNode node10 = new TreeNode();
		node10.setCodeId("j001");
		node10.setCodeLvl(3);
		node10.setCodeNm("파일10");
		node10.setParentId("e001");
		
		TreeNode node11 = new TreeNode();
		node11.setCodeId("k001");
		node11.setCodeLvl(3);
		node11.setCodeNm("파일11");
		node11.setParentId("e001");
	
		TreeNode node12 = new TreeNode();
		node12.setCodeId("l001");
		node12.setCodeLvl(3);
		node12.setCodeNm("파일12");
		node12.setParentId("k001");
	
		TreeNode node13 = new TreeNode();
		node13.setCodeId("m001");
		node13.setCodeLvl(3);
		node13.setCodeNm("파일13");
		node13.setParentId("l001");
	
		
		List<TreeNode> list = new ArrayList();
		list.add(node1);
		list.add(node2);
		list.add(node3);
		list.add(node4);
		list.add(node5);
		list.add(node6);
		list.add(node7);
		list.add(node8);
		list.add(node9);
		list.add(node10);
		list.add(node11);
		list.add(node12);
		list.add(node13);
		
		return list;
	}
	
	
	
}

package org.hdcd.controller.tree;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TreeController {
	
	@RequestMapping(value = "/treeTest", method = RequestMethod.GET)
	public String showTree() {
		return "treeTest/treeTest1";
	}
}

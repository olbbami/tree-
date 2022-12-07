package org.hdcd.controller.vo;

public class TreeNode {
	private String codeNm;
	private String codeId;
	private String parentId;
	private int codeLvl;
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public int getCodeLvl() {
		return codeLvl;
	}
	public void setCodeLvl(int codeLvl) {
		this.codeLvl = codeLvl;
	}
	
}

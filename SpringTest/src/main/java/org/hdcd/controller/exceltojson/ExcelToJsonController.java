package org.hdcd.controller.exceltojson;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hdcd.controller.vo.Customer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class ExcelToJsonController {
	
	@RequestMapping(value = "/excelToJson", method = RequestMethod.GET)
	public String goToView() {
		return "excelTojson/test1";
	}
	
	
	@RequestMapping(value="/excelReader.do", produces="text/plain; charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String excelReader(@RequestParam(name="file", required=false) MultipartFile file) throws Exception{
		 // 엑셀파일 확장자 체크
	    String fileNm = file.getOriginalFilename();
	    String sxn = fileNm.substring(fileNm.lastIndexOf('.')+1);
	    
//	    if(!(sxn.equals("xls") || sxn.equals("xlsx"))){
//	    	throw new InvalidException("엑셀 파일만 업로드 가능합니다.");
//	    }
	    
	    
	    
	    
	    // 암호화 해제 체크
	    List<Customer> mylist = readExcelFile(file.getInputStream());
	    
	    ObjectMapper mapper = new ObjectMapper();
	    
	    String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(mylist);
	    
	    return json;
	}
	
	
	private static List<Customer> readExcelFile(InputStream excelFile){
		try {
//			FileInputStream excelFile = new FileInputStream(new File(filePath));
    		Workbook workbook = new XSSFWorkbook(excelFile);
     
    		Sheet sheet = workbook.getSheet("Customers");
    		Iterator rows = sheet.iterator();
    		
    		List lstCustomers = new ArrayList<>();
    		
    		int rowNumber = 0;
    		while (rows.hasNext()) {
    			Row currentRow = (Row) rows.next();
    			
    			// skip header
    			if(rowNumber == 0) {
    				rowNumber++;
    				continue;
    			}
    			
    			Iterator cellsInRow = currentRow.iterator();
 
    			Customer cust = new Customer();
    			
    			int cellIndex = 0;
    			while (cellsInRow.hasNext()) {
    				Cell currentCell = (Cell) cellsInRow.next();
    				
    				if(cellIndex==0) { // ID
    					cust.setId(String.valueOf(currentCell.getNumericCellValue()));
    				} else if(cellIndex==1) { // Name
    					cust.setName(currentCell.getStringCellValue());
    				} else if(cellIndex==2) { // Address
    					cust.setAddress(currentCell.getStringCellValue());
    				} else if(cellIndex==3) { // Age
    					cust.setAge((int) currentCell.getNumericCellValue());
    				}
    				
    				cellIndex++;
    			}
    			
    			lstCustomers.add(cust);
    		}
    		
    		// Close WorkBook
    		workbook.close();
    		
    		return lstCustomers;
        } catch (Exception e) {
        	throw new RuntimeException("FAIL! -> message = " + e.getMessage());
        }
	}
	
	
}

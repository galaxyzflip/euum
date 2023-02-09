/** GoodsList 페이징에 필요 */

package com.mycom.euum.page;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@ToString
public class Criteria2 {
	
	private int pageNum; //페이지 번호 
	private int amount;  //한 페이지 당 보여줄 데이터 수  
	private int total;  //총 데이터 개수  
	
//	private int goodsCategory;
	
	private String type;
	private String keyword;
	private String sortCom; //정렬 
	
	// 한 페이지에서 보여줄 데이터 개수 : 10
	public Criteria2() { 
		this(1,5);
	}
	
	//변수에 저장 
	public Criteria2(int pageNum, int amount ) {
		this.pageNum=pageNum;
		this.amount=amount;
	
	}
	
	public String[] getTypeArr() {
		return type ==null? new String[] {} : type.split("");
	}
	
	

}

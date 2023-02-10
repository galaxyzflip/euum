package com.mycom.euum.page;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageForGoodsDTO {
	private int startPage1; // 승인완료
	private int endPage1;
	private int startPage2; // 승인대기
	private int endPage2;
	private int startPage3; // 임시저장
	private int endPage3;
	
	private boolean prev1, next1;
	private boolean prev2, next2;
	private boolean prev3, next3;

	private int total;
	
	private CriteriaForGoods cri; // 상품에서 다중 페이징을 위해 사용하는 Criteria

	public PageForGoodsDTO(CriteriaForGoods cri, int total, String goodsType) {
		switch (goodsType) {
        case "Goods": pagingGoods(cri, total);
        	break;
        case "UnapprovedGoods": pagingUnapprovedGoods(cri, total);
        	break;
        case "TempGoods": pagingTempGoods(cri, total);
        	break;
		}
	}

	
	// 상품상태마다 알맞은 변수만 초기화 (승인완료: 1 / 승인대기: 2 / 임시저장: 3)
	public void pagingGoods(CriteriaForGoods cri, int total) {
		this.cri = cri;
		this.total = total;

		this.endPage1 = (int) (Math.ceil(cri.getPageNum1() / 10.0)) * 10;
		this.startPage1 = this.endPage1 - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount1()));

		if (realEnd < this.endPage1) {
			this.endPage1 = realEnd;
		}

		this.prev1 = this.startPage1 > 1;
		this.next1 = this.endPage1 < realEnd;
	}

	public void pagingUnapprovedGoods(CriteriaForGoods cri, int total) {
		this.cri = cri;
		this.total = total;

		this.endPage2 = (int) (Math.ceil(cri.getPageNum2() / 10.0)) * 10;
		this.startPage2 = this.endPage2 - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount2()));

		if (realEnd < this.endPage2) {
			this.endPage2 = realEnd;
		}

		this.prev2 = this.startPage2 > 1;
		this.next2 = this.endPage2 < realEnd;
	}

	public void pagingTempGoods(CriteriaForGoods cri, int total) {
		this.cri = cri;
		this.total = total;

		this.endPage3 = (int) (Math.ceil(cri.getPageNum3() / 10.0)) * 10;
		this.startPage3 = this.endPage3 - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount3()));

		if (realEnd < this.endPage3) {
			this.endPage3 = realEnd;
		}

		this.prev3 = this.startPage3 > 1;
		this.next3 = this.endPage3 < realEnd;
	}
}

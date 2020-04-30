package com.web.spring.common;

public class PageFactory {
	public static String getPage(int totalData,int cPage,int numPerpage,String url) {
		//cPage:현재페이지 numPerPage:볼데이터수
		String pageBar="";//얘한테 누적시켜서 스트링으로 반환할것임
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
	
		if(pageNo==1) {

			pageBar += "<span><</span>";

		}
		else {

			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")' tabindex='-1'><</a>";
			
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
	
				pageBar+="<a href='javascript:fn_paging("+pageNo+")' tabindex='-1'>"+pageNo+"</a>";
		
			}else {
			
				pageBar+="<a href='javascript:fn_paging("+pageNo+")' tabindex='-1'>"+pageNo+"</a>";
			
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
		
			pageBar+="<a href='#' tabindex='-1'>></a>";
		
			
		}else {
			
			pageBar+="<a href='javascript:fn_paging("+pageNo+")'>></a>";
			
		}
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}

}

package com.web.spring.common;

public class PageFactory2 {
	public static String getPage(int totalData,int cPage,int numPerpage,String url) {
		//cPage:현재페이지 numPerPage:볼데이터수
		String pageBar="<ul class='pagination justify-content-center'>";//얘한테 누적시켜서 스트링으로 반환할것임
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
	
		if(pageNo==1) {

			pageBar += "<li class='page-item disabled'><a class='page-link' href='#'><</a></li>";

		}
		else {

			pageBar+="<li class='page-item'><a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")' tabindex='-1'><</a></li>";
			
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
	
				pageBar+="<li class='page-item active'><a class='page-link' href='javascript:fn_paging("+pageNo+")' tabindex='-1'>"+pageNo+"</a></li>";
		
			}else {
			
				pageBar+="<li class='page-item'><a class='page-link' href='javascript:fn_paging("+pageNo+")' tabindex='-1'>"+pageNo+"</a></li>";
			
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
		
			pageBar+="<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1'>></a></li>";
		
			
		}else {
			
			pageBar+="<li class='page-item'><a class='page-link' href='javascript:fn_paging("+pageNo+")'>></a></li>";
			
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

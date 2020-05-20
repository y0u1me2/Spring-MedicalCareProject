package com.web.spring.map.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.web.spring.map.model.service.MapService;
import com.web.spring.map.model.vo.Hospital;
import com.web.spring.map.model.vo.Hospital2;

@Controller
public class HospitalMapController {

	@Autowired
	private MapService service;
	
	@RequestMapping("/hospitalMap.do")
	private String hospitalMap() {
		return "client/map/hospitalMap";
	}

	@RequestMapping("/mapTest.do")
	private String mapTest() {
		return "client/map/mapTest";
	}
	
	@RequestMapping("/about")
	private String introduction() {
		return "client/introduction/introduction";
	}
	
	@RequestMapping("/service")
	private String service() {
		return "client/introduction/service";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/hospitalFind.do", produces = "application/text; charset=utf-8")
	private String hospitalFind(
			@RequestParam(required = false, defaultValue = "") String latitude,
			@RequestParam(required = false, defaultValue = "") String longitude,
			@RequestParam(required = false, defaultValue = "1") String pageNo,
			@RequestParam(required = false, defaultValue = "10") String numOfRows,
			@RequestParam(required = false, defaultValue = "") String name,
			@RequestParam(required = false, defaultValue = "") String dept, 
			@RequestParam(required = false, defaultValue = "") String radius, 
			HttpServletResponse response) throws IOException {
		
		System.out.println(radius);
		System.out.println(dept);
		System.out.println(latitude);
		System.out.println(longitude);

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=j3l4%2FlL9sulpZEYY467tIsTngXuIhRTIddhNB4wrTzRNtaGQ5w6eGH1Jah%2FmXu2JMdja84GrX0hrpsZ1dludpw%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /* 한 페이지 결과 수 */
//        urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode("110000", "UTF-8")); /*시도코드*/
//        urlBuilder.append("&" + URLEncoder.encode("sgguCd","UTF-8") + "=" + URLEncoder.encode("110019", "UTF-8")); /*시군구코드*/
//        urlBuilder.append("&" + URLEncoder.encode("emdongNm","UTF-8") + "=" + URLEncoder.encode("이매동", "UTF-8")); /*읍면동명*/
		urlBuilder.append("&" + URLEncoder.encode("yadmNm", "UTF-8") + "=" + URLEncoder.encode(name, "UTF-8")); /* 병원명 (UTF-8 인코딩 필요) */
//        urlBuilder.append("&" + URLEncoder.encode("zipCd","UTF-8") + "=" + URLEncoder.encode("2010", "UTF-8")); /*2010:종합병원, 2030:병원, 2040:요양병원, 2050:치과, 2060:한방, 2070:의원, 2080:보건기관, 2090:조산원*/
//        urlBuilder.append("&" + URLEncoder.encode("clCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*종별코드*/
        urlBuilder.append("&" + URLEncoder.encode("dgsbjtCd","UTF-8") + "=" + URLEncoder.encode(dept, "UTF-8")); /*진료과목코드*/
		urlBuilder.append("&" + URLEncoder.encode("xPos", "UTF-8") + "=" + URLEncoder.encode(longitude, "UTF-8")); /* x좌표(소수점 15) */
		urlBuilder.append("&" + URLEncoder.encode("yPos", "UTF-8") + "=" + URLEncoder.encode(latitude, "UTF-8")); /* y좌표(소수점 15) */
        urlBuilder.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + URLEncoder.encode(radius, "UTF-8")); /*단위 : 미터(m)*/
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
//        System.out.println(sb.toString());
//        response.setContentType("text/html; charset=utf-8");
//        response.getWriter().write(new String(sb));
		return sb.toString();
	}

	private static String getTagValue(String tag, Element eElement) {
		
		if(eElement.getElementsByTagName(tag).item(0)==null) {
			return null;
		}else {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			Node nValue = (Node) nlList.item(0);
			if (nValue == null)
				return null;
			return nValue.getNodeValue();
		}
	}

	
	
	
	
	
	
	@RequestMapping("/insertData.do")
	private void hospitalFind2(@RequestParam(required = false, defaultValue = "") String latitude,
			@RequestParam(required = false, defaultValue = "") String longitude,
			@RequestParam(required = false, defaultValue = "") String pageNo,
			@RequestParam(required = false, defaultValue = "") String numOfRows,
			@RequestParam(required = false, defaultValue = "") String name, HttpServletResponse response)
			throws IOException {

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList"); /* URL */
//      urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("j3l4%2FlL9sulpZEYY467tIsTngXuIhRTIddhNB4wrTzRNtaGQ5w6eGH1Jah%2FmXu2JMdja84GrX0hrpsZ1dludpw%3D%3D", "UTF-8")); /*서비스키*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=j3l4%2FlL9sulpZEYY467tIsTngXuIhRTIddhNB4wrTzRNtaGQ5w6eGH1Jah%2FmXu2JMdja84GrX0hrpsZ1dludpw%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="+ URLEncoder.encode("72935", "UTF-8")); /* 한 페이지 결과 수 */
//      urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode("110000", "UTF-8")); /*시도코드*/
//      urlBuilder.append("&" + URLEncoder.encode("sgguCd","UTF-8") + "=" + URLEncoder.encode("110019", "UTF-8")); /*시군구코드*/
//      urlBuilder.append("&" + URLEncoder.encode("emdongNm","UTF-8") + "=" + URLEncoder.encode("이매동", "UTF-8")); /*읍면동명*/
		urlBuilder.append("&" + URLEncoder.encode("yadmNm", "UTF-8") + "="+ URLEncoder.encode(name, "UTF-8")); /* 병원명 (UTF-8 인코딩 필요) */
//      urlBuilder.append("&" + URLEncoder.encode("zipCd","UTF-8") + "=" + URLEncoder.encode("2010", "UTF-8")); /*2010:종합병원, 2030:병원, 2040:요양병원, 2050:치과, 2060:한방, 2070:의원, 2080:보건기관, 2090:조산원*/
//      urlBuilder.append("&" + URLEncoder.encode("clCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*종별코드*/
//      urlBuilder.append("&" + URLEncoder.encode("dgsbjtCd","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*진료과목코드*/
		urlBuilder.append("&" + URLEncoder.encode("xPos", "UTF-8") + "="+ URLEncoder.encode(longitude, "UTF-8")); /* x좌표(소수점 15) */
		urlBuilder.append("&" + URLEncoder.encode("yPos", "UTF-8") + "="+ URLEncoder.encode(latitude, "UTF-8")); /* y좌표(소수점 15) */
//      urlBuilder.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*단위 : 미터(m)*/
//      urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));

//		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		List<Hospital> list = new ArrayList<Hospital>();
		
		try {
			String url = urlBuilder.toString();
			System.out.println(url);
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// root tag
			doc.getDocumentElement().normalize();
			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			// System.out.println("파싱할 리스트 수 : "+ nList.getLength());

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
//					System.out.println("######################");
					// System.out.println(eElement.getTextContent());
//					System.out.println("병원이름  : " + getTagValue("yadmNm", eElement));
//					System.out.println("경도  : " + getTagValue("XPos", eElement));
//					System.out.println("위도  : " + getTagValue("YPos", eElement));
//					System.out.println("홈페이지  : " + getTagValue("hospUrl", eElement));
//					System.out.println("요양기호 : " + getTagValue("ykiho", eElement));
//					System.out.println("전화번호 : " + getTagValue("telno", eElement));
//					System.out.println("주소 : " + getTagValue("addr", eElement));

					
//					Map<String, String> map = new HashMap<String, String>(); 
//					map.put("name", getTagValue("yadmNm", eElement)); 
//					map.put("addr", getTagValue("addr", eElement));
//					map.put("tel", getTagValue("telno", eElement));
//					map.put("hospNo", getTagValue("ykiho", eElement));
//					map.put("hospUrl", getTagValue("hospUrl", eElement));
//					map.put("latitude", getTagValue("YPos", eElement));
//					map.put("longitude", getTagValue("XPos", eElement));
					
					Hospital h = new Hospital();
					h.setHospNo(getTagValue("ykiho", eElement));
					h.setHospAddr(getTagValue("addr", eElement));
					h.setHospName(getTagValue("yadmNm", eElement));
					h.setHospTel(getTagValue("telno", eElement));
					h.setHospUrl(getTagValue("hospUrl", eElement));
					h.setLatitude(getTagValue("YPos", eElement));
					h.setLongitude(getTagValue("XPos", eElement));
					
					list.add(h);
					

				} // for end
			} // if end
			
			int result = service.insertData(list);
			System.out.println(result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	@RequestMapping("/insertData2.do")
	private void insertData(@RequestParam(required = false, defaultValue = "") String latitude,
			@RequestParam(required = false, defaultValue = "") String longitude,
			@RequestParam(required = false, defaultValue = "") String pageNo,
			@RequestParam(required = false, defaultValue = "") String numOfRows,
			@RequestParam(required = false, defaultValue = "") String name, HttpServletResponse response)
			throws IOException {

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=j3l4%2FlL9sulpZEYY467tIsTngXuIhRTIddhNB4wrTzRNtaGQ5w6eGH1Jah%2FmXu2JMdja84GrX0hrpsZ1dludpw%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("8", "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="+ URLEncoder.encode("10000", "UTF-8")); /* 한 페이지 결과 수 */


		List<Hospital2> list = new ArrayList<Hospital2>();
		
		try {
			String url = urlBuilder.toString();
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// root tag
			doc.getDocumentElement().normalize();
			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			// System.out.println("파싱할 리스트 수 : "+ nList.getLength());

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					
					Hospital2 h = new Hospital2();
					h.setHospId(getTagValue("hpid", eElement));
					h.setHospName(getTagValue("dutyName", eElement));
					h.setHospAddr(getTagValue("dutyAddr", eElement));
					h.setHospTel(getTagValue("dutyTel1", eElement));
					h.setHospDirections(getTagValue("dutyMapimg", eElement));
					h.setHospLat(getTagValue("wgs84Lat", eElement));
					h.setHospLon(getTagValue("wgs84Lon", eElement));
					h.setMedicalDepartment(getTagValue("dgidIdName", eElement));
					
					if(getTagValue("dutyTime1s", eElement)==null) {
						h.setOfficeHour1(null);
					}else {
						h.setOfficeHour1(getTagValue("dutyTime1s", eElement).substring(0, 2)+":"+getTagValue("dutyTime1s", eElement).substring(2)+"-"+getTagValue("dutyTime1c", eElement).substring(0, 2)+":"+getTagValue("dutyTime1c", eElement).substring(2));
					}
					if(getTagValue("dutyTime2s", eElement)==null) {
						h.setOfficeHour2(null);
					}else {
						h.setOfficeHour2(getTagValue("dutyTime2s", eElement).substring(0, 2)+":"+getTagValue("dutyTime2s", eElement).substring(2)+"-"+getTagValue("dutyTime2c", eElement).substring(0, 2)+":"+getTagValue("dutyTime2c", eElement).substring(2));
					}
					if(getTagValue("dutyTime3s", eElement)==null) {
						h.setOfficeHour3(null);
					}else {
						h.setOfficeHour3(getTagValue("dutyTime3s", eElement).substring(0, 2)+":"+getTagValue("dutyTime3s", eElement).substring(2)+"-"+getTagValue("dutyTime3c", eElement).substring(0, 2)+":"+getTagValue("dutyTime3c", eElement).substring(2));
					}
					if(getTagValue("dutyTime4s", eElement)==null) {
						h.setOfficeHour4(null);
					}else {
						h.setOfficeHour4(getTagValue("dutyTime4s", eElement).substring(0, 2)+":"+getTagValue("dutyTime4s", eElement).substring(2)+"-"+getTagValue("dutyTime4c", eElement).substring(0, 2)+":"+getTagValue("dutyTime4c", eElement).substring(2));
					}
					if(getTagValue("dutyTime5s", eElement)==null) {
						h.setOfficeHour5(null);
					}else {
						h.setOfficeHour5(getTagValue("dutyTime5s", eElement).substring(0, 2)+":"+getTagValue("dutyTime5s", eElement).substring(2)+"-"+getTagValue("dutyTime5c", eElement).substring(0, 2)+":"+getTagValue("dutyTime5c", eElement).substring(2));
					}
					if(getTagValue("dutyTime6s", eElement)==null) {
						h.setOfficeHour6(null);
					}else {
						h.setOfficeHour6(getTagValue("dutyTime6s", eElement).substring(0, 2)+":"+getTagValue("dutyTime6s", eElement).substring(2)+"-"+getTagValue("dutyTime6c", eElement).substring(0, 2)+":"+getTagValue("dutyTime6c", eElement).substring(2));
					}
					if(getTagValue("dutyTime7s", eElement)==null) {
						h.setOfficeHour7(null);
					}else {
						h.setOfficeHour7(getTagValue("dutyTime7s", eElement).substring(0, 2)+":"+getTagValue("dutyTime7s", eElement).substring(2)+"-"+getTagValue("dutyTime7c", eElement).substring(0, 2)+":"+getTagValue("dutyTime7c", eElement).substring(2));
					}
					if(getTagValue("dutyTime8s", eElement)==null) {
						h.setOfficeHour8(null);
					}else {
						h.setOfficeHour8(getTagValue("dutyTime8s", eElement).substring(0, 2)+":"+getTagValue("dutyTime8s", eElement).substring(2)+"-"+getTagValue("dutyTime8c", eElement).substring(0, 2)+":"+getTagValue("dutyTime8c", eElement).substring(2));
					}
					
					
					
					
					
//					h.setOfficeHour1(getTagValue("dutyTime1s", eElement).+"-"+getTagValue("dutyTime1c", eElement));
//					h.setOfficeHour2(getTagValue("dutyTime2s", eElement)+"-"+getTagValue("dutyTime2c", eElement));
//					h.setOfficeHour3(getTagValue("dutyTime3s", eElement)+"-"+getTagValue("dutyTime3c", eElement));
//					h.setOfficeHour4(getTagValue("dutyTime4s", eElement)+"-"+getTagValue("dutyTime4c", eElement));
//					h.setOfficeHour5(getTagValue("dutyTime5s", eElement)+"-"+getTagValue("dutyTime5c", eElement));
//					h.setOfficeHour6(getTagValue("dutyTime6s", eElement)+"-"+getTagValue("dutyTime6c", eElement));
//					h.setOfficeHour7(getTagValue("dutyTime7s", eElement)+"-"+getTagValue("dutyTime7c", eElement));
//					h.setOfficeHour8(getTagValue("dutyTime8s", eElement)+"-"+getTagValue("dutyTime8c", eElement));
					list.add(h);
					

				} // for end
			} // if end
			
			int result = service.insertData2(list);
			System.out.println(result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	
	
	
	
	

}

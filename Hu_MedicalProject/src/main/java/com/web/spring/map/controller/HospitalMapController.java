package com.web.spring.map.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@Controller
public class HospitalMapController {

	@Autowired
	private MapService service;
	
	@RequestMapping("/hospitalMap.do")
	private String hospitalMap() {
		return "client/map/hospitalMap";
	}

	@ResponseBody
	@RequestMapping(value = "/hospitalFind.do", produces = "application/text; charset=utf-8")
	private String hospitalFind(@RequestParam(required = false, defaultValue = "") String latitude,
			@RequestParam(required = false, defaultValue = "") String longitude,
			@RequestParam(required = false, defaultValue = "1") String pageNo,
			@RequestParam(required = false, defaultValue = "100") String numOfRows,
			@RequestParam(required = false, defaultValue = "") String name, HttpServletResponse response)
			throws IOException {
		System.out.println(latitude);
		System.out.println(latitude);
		System.out.println(name);

		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList"); /* URL */
//        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("j3l4%2FlL9sulpZEYY467tIsTngXuIhRTIddhNB4wrTzRNtaGQ5w6eGH1Jah%2FmXu2JMdja84GrX0hrpsZ1dludpw%3D%3D", "UTF-8")); /*서비스키*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=j3l4%2FlL9sulpZEYY467tIsTngXuIhRTIddhNB4wrTzRNtaGQ5w6eGH1Jah%2FmXu2JMdja84GrX0hrpsZ1dludpw%3D%3D"); /*
																														 * Service
																														 * Key
																														 */
		urlBuilder.append(
				"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode(numOfRows, "UTF-8")); /* 한 페이지 결과 수 */
//        urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode("110000", "UTF-8")); /*시도코드*/
//        urlBuilder.append("&" + URLEncoder.encode("sgguCd","UTF-8") + "=" + URLEncoder.encode("110019", "UTF-8")); /*시군구코드*/
//        urlBuilder.append("&" + URLEncoder.encode("emdongNm","UTF-8") + "=" + URLEncoder.encode("이매동", "UTF-8")); /*읍면동명*/
		urlBuilder.append("&" + URLEncoder.encode("yadmNm", "UTF-8") + "="
				+ URLEncoder.encode(name, "UTF-8")); /* 병원명 (UTF-8 인코딩 필요) */
//        urlBuilder.append("&" + URLEncoder.encode("zipCd","UTF-8") + "=" + URLEncoder.encode("2010", "UTF-8")); /*2010:종합병원, 2030:병원, 2040:요양병원, 2050:치과, 2060:한방, 2070:의원, 2080:보건기관, 2090:조산원*/
//        urlBuilder.append("&" + URLEncoder.encode("clCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*종별코드*/
//        urlBuilder.append("&" + URLEncoder.encode("dgsbjtCd","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*진료과목코드*/
		urlBuilder.append("&" + URLEncoder.encode("xPos", "UTF-8") + "="
				+ URLEncoder.encode(longitude, "UTF-8")); /* x좌표(소수점 15) */
		urlBuilder.append("&" + URLEncoder.encode("yPos", "UTF-8") + "="
				+ URLEncoder.encode(latitude, "UTF-8")); /* y좌표(소수점 15) */
//        urlBuilder.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*단위 : 미터(m)*/
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
			return "";
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

}

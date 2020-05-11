package com.web.spring.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;



public class AESEncrypt {

	 //AES방식으로 양뱡향 암호화하는 객체
	   
	   //생성과 동시에 암호화키를 생성 or 있는 키를 가져오기
	   //암호화처리 메소드작성
	   //복호화처리(해독) 메소드작성
	   
	   //키값을 저장하는 객체가 있음
	   //SecretKey 객체로 생성한 key값을 저장
	   // *암호화관련 패키지 javax.crypto패키지에 만들어져 있음
	   
	   private static SecretKey key;
	   private String path;
	   
	   public AESEncrypt(String path) {
	      //생성자, 객체가 생성될때 key값을 초기화하기(listener로 )
	      this.path=path;
	      File f = new File(path+"/secret.bs");
	      System.out.println("파일있니?" +f.exists());
	      if(f.exists()) {//파일이 있으면?
	         //있는 파일 불러오기
	         try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream(f))){
	            key = (SecretKey)ois.readObject(); //불러올때 object로 불러오기 때문에 형변환
	         }catch(ClassNotFoundException e) {
	            e.printStackTrace();
	         }catch(IOException e) {
	            e.printStackTrace();
	         }
	      }else {//파일이 없으면?
	         //없으면 생성하기
	         try {
	         generateKey();
	         }catch(NoSuchAlgorithmException e) {
	            e.printStackTrace();
	         }
	      }
	         
	   }
	   
	   //key를 생성하는 메소드
	   public void generateKey() throws NoSuchAlgorithmException {
	      SecureRandom sr = new SecureRandom(); //암호화 키를 위한 솔트값
	      KeyGenerator keyGen; //key를 생성해서 저장하는 객체
	      
	      keyGen = KeyGenerator.getInstance("AES"); //AES방식의 key값을 생성 설정
	      
	      //생성된 알고리즘으로 key값 초기화 시키기
	      //init(key 비트수,솔트값)
	      keyGen.init(128,sr); //키값을 초기화
	   
	      key = keyGen.generateKey();//key값 생성
	      
	      //생성된 key값은 파일로 저장하여 관리함.
	      //파일의 경로는 외부에서 접근못하는 WEB-INF폴더에 넣어줌
	      File f = new File(path+"/secret.bs");
	      
	      try(ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f) )){
	         oos.writeObject(key);
	   
	      }catch(IOException e) {
	      e.printStackTrace();
	      }
	   
	   }
	   
	   //암호화 메소드 만들기
	   //필요한곳에서 사용할 수 있게 static으로 작성
	   public static String encrypt(String str) {
	      
	      byte[] enStr = null;
	      try {
	      //Cipher객체를 이용하여 암호화를 진행
	      Cipher cipher = Cipher.getInstance("AES");//cipher설정 암호화 방식(AES) 지정
	      cipher.init(Cipher.ENCRYPT_MODE, key);//cipher설정 암호화 key값 지정
	      enStr = cipher.doFinal(str.getBytes());//바이트로 암호화처리 
	      }catch(Exception e) {
	         e.printStackTrace();
	      }   
	      //암호화된 비트를 base64인코더를 이용하여 string으로 바꿔서 리턴
	      //enStr이 null인 경우 원본값이 출력되게 처리
	      return enStr!=null?Base64.getEncoder().encodeToString(enStr):str;
	   }
	   
	   //복호화 메소드만들기
	   public static String decrypt(String str) throws UnsupportedEncodingException {
	      
	      byte[] decryptStr = null;      
	      try {
	         Cipher cipher = Cipher.getInstance("AES");
	         cipher.init(Cipher.DECRYPT_MODE, key);
	         //위에서 암호화해서(Base64를 이용) 보낸 값이 String이기떄문에 다시 Base64디코더를 이용하여 byte[]로 바꿔줌
	         byte[] decodeStr = Base64.getDecoder().decode(str.getBytes());
	         
	         decryptStr = cipher.doFinal(decodeStr);
	      }catch(Exception e) {   
	         //e.printStackTrace();
	         //NoSuchAlgorithmException - 알고리즘이 없을 경우
	         //NoSuchPaddingException - 공간,사이즈에 대한 예외처리
	         //IlligalBlockSizeException
	         //BadPaddingException 
	         //InvalidKeyException - key값이 잘못된 경우
	         return str;
	      }
	      return new String(decryptStr,"UTF-8");
	   }
	   
	   //복호화 해주는 코드가 겹치므로 메소드로 만들어주기 (list는 주소기때문에 return해줄 필요 없음)
//	   public static void changeDecrypt(List<Member> list){
//	      //암호화 복호화처리하기
//	      for(Member m : list) {
//	         try {
//		         m.setEmail(decrypt(m.getEmail()));
//		         m.setPhone(decrypt(m.getPhone()));
//		         m.setAddress(decrypt(m.getAddress()));
//	         }catch(UnsupportedEncodingException e){
//	        	 e.printStackTrace();
//	         }
//	      }
//	   }

}

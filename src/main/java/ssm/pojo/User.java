package ssm.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{

	private static final long serialVersionUID = 190776250851641700L;

	private int uId;
	private String uPassword;
	private String uEmail;
	private String uTel;
	private Date  uRegistDate;
	private int isLock;

	private String smPho;
	private String uName;
	private String uGender;
	private String uWord;
	private String uResidence;
	private String uProfession;
	private int uAuthority;	//普通为0，管理员100


	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuTel() {
		return uTel;
	}
	public void setuTel(String uTel) {
		this.uTel = uTel;
	}

	/*public String getuRegistDate() {
		String s[]=this.uRegistDate.split(" ");
		String uRegistDate=s[0];
		return uRegistDate;
	}*/

	public int getIsLock() {
		return isLock;
	}

	public void setIsLock(int isLock) {
		this.isLock = isLock;
	}

	public Date getuRegistDate() {
		return uRegistDate;
	}

	public void setuRegistDate(Date uRegistDate) {
		this.uRegistDate = uRegistDate;
	}

	public String getSmPho() {
		return smPho;
	}
	public void setSmPho(String smPho) {
		this.smPho = smPho;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuGender() {
		return uGender;
	}
	public void setuGender(String uGender) {
		this.uGender = uGender;
	}
	public String getuWord() {
		return uWord;
	}
	public void setuWord(String uWord) {
		this.uWord = uWord;
	}
	public String getuResidence() {
		return uResidence;
	}
	public void setuResidence(String uResidence) {
		this.uResidence = uResidence;
	}
	public String getuProfession() {
		return uProfession;
	}
	public void setuProfession(String uProfession) {
		this.uProfession = uProfession;
	}
	public int getuAuthority() {
		return uAuthority;
	}
	public void setuAuthority(int uAuthority) {
		this.uAuthority = uAuthority;
	}



}

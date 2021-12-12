package lr.bean;

public class Student {
	private String Stunum;
	private String name;
	private int Core1;
	private int Core2;
	private int Core3;
	private String Remarks;
	public String getRemarks() {
		return Remarks;
	}
	public void setRemarks(String remarks) {
		Remarks = remarks;
	}
	public String getStunum() {
		return Stunum;
	}
	public void setStunum(String stunum) {
		Stunum = stunum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCore1() {
		return Core1;
	}
	public void setCore1(int core1) {
		Core1 = core1;
	}
	public int getCore2() {
		return Core2;
	}
	public void setCore2(int core2) {
		Core2 = core2;
	}
	public int getCore3() {
		return Core3;
	}
	public void setCore3(int core3) {
		Core3 = core3;
	}
}

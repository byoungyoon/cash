package kr.co.gdu.cash.vo;

public class Guestbook {
	private int guestbookId;
	private String guestbookName;
	private String guestbookTitle;
	private String guestbookContent;
	private String guestbookDate;
	public int getGuestbookId() {
		return guestbookId;
	}
	public void setGuestbookId(int guestbookId) {
		this.guestbookId = guestbookId;
	}
	public String getGuestbookName() {
		return guestbookName;
	}
	public void setGuestbookName(String guestbookName) {
		this.guestbookName = guestbookName;
	}
	public String getGuestbookTitle() {
		return guestbookTitle;
	}
	public void setGuestbookTitle(String guestbookTitle) {
		this.guestbookTitle = guestbookTitle;
	}
	public String getGuestbookContent() {
		return guestbookContent;
	}
	public void setGuestbookContent(String guestbookContent) {
		this.guestbookContent = guestbookContent;
	}
	public String getGuestbookDate() {
		return guestbookDate;
	}
	public void setGuestbookDate(String guestbookDate) {
		this.guestbookDate = guestbookDate;
	}
	
	@Override
	public String toString() {
		return "Guestbook [guestbookId=" + guestbookId + ", guestbookName=" + guestbookName + ", guestbookTitle="
				+ guestbookTitle + ", guestbookContent=" + guestbookContent + ", guestbookDate=" + guestbookDate + "]";
	}
}

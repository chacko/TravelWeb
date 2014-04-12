package TrvlEntity;

import java.sql.Date;

public class Bookings 
{
	
	private Integer BkgId;
	private Date  BkgDate;
	private String BkgNumber;
	
	private Double 	TrvlCount;
	private String 	Trip;
	private String 	Package;
	private Date	PkgStartDt;
	private Date	PkgEndDt;
	private String	PkgDesc;
	private Double	PkgPrice;
	
	/**
	 * @return the bkgId
	 */
	public Integer getBkgId() {
		return BkgId;
	}
	/**
	 * @param bkgId the bkgId to set
	 */
	public void setBkgId(Integer bkgId) {
		BkgId = bkgId;
	}
	/**
	 * @return the bkgDate
	 */
	public Date getBkgDate() {
		return BkgDate;
	}
	/**
	 * @param bkgDate the bkgDate to set
	 */
	public void setBkgDate(Date bkgDate) {
		BkgDate = bkgDate;
	}
	/**
	 * @return the bkgNumber
	 */
	public String getBkgNumber() 
	{
		return BkgNumber;
	}
	/**
	 * @param bkgNumber the bkgNumber to set
	 */
	public void setBkgNumber(String bkgNumber) {
		BkgNumber = bkgNumber;
	}
	public Double getTrvlCount() {
		return TrvlCount;
	}
	public void setTrvlCount(Double trvlCount) {
		TrvlCount = trvlCount;
	}
	public String getTrip() {
		return Trip;
	}
	public void setTrip(String trip) {
		Trip = trip;
	}
	public String getPackage() {
		return Package;
	}
	public void setPackage(String package1) {
		Package = package1;
	}
	public Date getPkgStartDt() {
		return PkgStartDt;
	}
	public void setPkgStartDt(Date pkgStartDt) {
		PkgStartDt = pkgStartDt;
	}
	public Date getPkgEndDt() {
		return PkgEndDt;
	}
	public void setPkgEndDt(Date pkgEndDt) {
		PkgEndDt = pkgEndDt;
	}
	public String getPkgDesc() {
		return PkgDesc;
	}
	public void setPkgDesc(String pkgDesc) {
		PkgDesc = pkgDesc;
	}
	public Double getPkgPrice() {
		return PkgPrice;
	}
	public void setPkgPrice(Double pkgPrice) {
		PkgPrice = pkgPrice;
	}
}

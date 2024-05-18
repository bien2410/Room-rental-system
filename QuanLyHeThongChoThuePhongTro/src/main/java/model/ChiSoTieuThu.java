package model;

public class ChiSoTieuThu {
	private int id;
	private ChiSoCongTo chiSoCongTo;
	public ChiSoTieuThu() {
		super();
	}

	public ChiSoTieuThu(ChiSoCongTo chiSoCongTo) {
		super();
		this.chiSoCongTo = chiSoCongTo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ChiSoCongTo getChiSoCongTo() {
		return chiSoCongTo;
	}

	public void setChiSoCongTo(ChiSoCongTo chiSoCongTo) {
		this.chiSoCongTo = chiSoCongTo;
	}

	
}

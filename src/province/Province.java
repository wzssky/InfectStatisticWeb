package province;

public class Province {
    private String province;
    private int ip;
    private int sp;
    private int cure;
    private int dead;
    public Province(String province,int ip,int sp,int cure,int dead)
    {
        this.province = province;
        this.ip = ip;
        this.sp = sp;
        this.cure = cure;
        this.dead = dead;
    }
    public Province(String province)
    {
        this.province = province;
        this.ip = 0;
        this.sp = 0;
        this.cure = 0;
        this.dead = 0;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public int getIp() {
        return ip;
    }

    public void setIp(int ip) {
        this.ip = ip;
    }

    public int getSp() {
        return sp;
    }

    public void setSp(int sp) {
        this.sp = sp;
    }
    public int getCure() {
        return cure;
    }

    public void setCure(int cure) {
        this.cure = cure;
    }

    public int getDead() {
        return dead;
    }

    public void setDead(int dead) {
        this.dead = dead;
    }
}

package filmsystem.Model;

import java.io.Serializable;

public class Cinema extends User implements Serializable {
    private String city;
    private String address;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}

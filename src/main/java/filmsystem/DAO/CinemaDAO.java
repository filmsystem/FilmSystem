package filmsystem.DAO;

import java.sql.*;
import java.util.ArrayList;

import filmsystem.DAO.BaseDAO;
import filmsystem.Model.Film;
import filmsystem.Model.Cinema;

public class CinemaDAO {
    PreparedStatement pstmt;

    public boolean insertCinema(Cinema cinema) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement(
                    "insert into cinema (username, password, img, city, address) values(?,?,?,?,?)");
            pstmt.setString(1, cinema.getUsername());
            pstmt.setString(2, cinema.getPassword());
            pstmt.setString(3, cinema.getImg());
            pstmt.setString(4, cinema.getCity());
            pstmt.setString(5, cinema.getAddress());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCinema(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("delete from cinema where id=?");
            pstmt.setInt(1, id);
            int i = pstmt.executeUpdate();
            if (i == 1)
                return true;
            else
                return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<Cinema> searchForList() {
        ArrayList<Cinema> al = new ArrayList<Cinema>();
        try {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Cinema cinema = new Cinema();
                cinema.setId(rs.getInt(1));
                cinema.setUsername(rs.getString(2));
                cinema.setPassword(rs.getString(3));
                cinema.setImg(rs.getString(4));
                cinema.setCity(rs.getString(5));
                cinema.setAddress(rs.getString(6));
                al.add(cinema);
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Cinema> searchCinemaById(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from cinema where id=?");
            pstmt.setInt(1, id);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Cinema> searchCinemaByName(String name) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from cinema where username=?");
            pstmt.setString(1, name);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Cinema> listAllCinema() {
        ArrayList<Cinema> al = new ArrayList<Cinema>();
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from cinema");
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateCinema(Cinema cinema) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement(
                    "update cinema set username=?,password=?,img=?,city=?,address=? where id=?");
            pstmt.setString(1, cinema.getUsername());
            pstmt.setString(2, cinema.getPassword());
            pstmt.setString(3, cinema.getImg());
            pstmt.setString(4, cinema.getCity());
            pstmt.setString(5, cinema.getAddress());
            pstmt.setInt(6, cinema.getId());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

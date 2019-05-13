package filmsystem.DAO;

import filmsystem.Model.FilmOffice;

import java.sql.*;
import java.util.ArrayList;

public class FilmOfficeDAO {
    PreparedStatement pstmt;

    public boolean insertFilmOffice(FilmOffice filmOffice) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("insert into filmoffice (filmId,officeId,row,col) values(?,?,?,?)");
            pstmt.setInt(1, filmOffice.getCinemaId());
            pstmt.setInt(2, filmOffice.getOfficeId());
            pstmt.setInt(3, filmOffice.getRow());
            pstmt.setInt(4, filmOffice.getCol());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteFilmOffice(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("delete from filmoffice where id=?");
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

    public ArrayList<FilmOffice> searchForList() {
        ArrayList<FilmOffice> al = new ArrayList<FilmOffice>();
        try {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                FilmOffice f = new FilmOffice();
                f.setId(rs.getInt(1));
                f.setCinemaId(rs.getInt(2));
                f.setOfficeId(rs.getInt(3));
                f.setRow(rs.getInt(4));
                f.setCol(rs.getInt(5));
                al.add(f);
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<FilmOffice> searchFilmOfficeById(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from filmoffice where id=?");
            pstmt.setInt(1, id);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<FilmOffice> searchFilmOfficeByCinemaId(int cinemaId) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from filmoffice where cinemaId=?");
            pstmt.setInt(1, cinemaId);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<FilmOffice> searchFilmOfficeByOfficeId(int officeId) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from filmoffice where officeId=?");
            pstmt.setInt(1, officeId);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<FilmOffice> listAllFilmOffice() {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from filmoffice");
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateFilmOffice(FilmOffice filmOffice) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("update filmoffice set filmId=?,officeId=?,row=?,col=? where id=?");
            pstmt.setInt(1, filmOffice.getCinemaId());
            pstmt.setInt(2, filmOffice.getOfficeId());
            pstmt.setInt(3, filmOffice.getRow());
            pstmt.setInt(4, filmOffice.getCol());
            pstmt.setInt(5, filmOffice.getId());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

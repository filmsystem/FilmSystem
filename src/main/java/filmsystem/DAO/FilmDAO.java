package filmsystem.DAO;

import java.sql.*;
import java.util.ArrayList;

import filmsystem.DAO.BaseDAO;
import filmsystem.Model.Film;

public class FilmDAO {
    PreparedStatement pstmt;

    public boolean insertFilm(Film film) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement(
                    "insert into film (id ,name, img, star, directors, casts, year, countries, type, summary) values(?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, film.getId());
            pstmt.setString(2, film.getName());
            pstmt.setString(3, film.getImg());
            pstmt.setFloat(4, (float) film.getStar());
            pstmt.setString(5, film.getDirectors());
            pstmt.setString(6, film.getCasts());
            pstmt.setInt(7, film.getYear());
            pstmt.setString(8, film.getCountries());
            pstmt.setString(9, film.getType());
            pstmt.setString(10, film.getSummary());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteFilm(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("delete from film where id=?");
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

    public ArrayList<Film> searchForList() {
        ArrayList<Film> al = new ArrayList<Film>();
        try {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Film film = new Film();
                film.setId(rs.getInt(1));
                film.setName(rs.getString(2));
                film.setImg(rs.getString(3));
                film.setStar(rs.getFloat(4));
                film.setDirectors(rs.getString(5));
                film.setCasts(rs.getString(6));
                film.setYear(rs.getInt(7));
                film.setCountries(rs.getString(8));
                film.setType(rs.getString(9));
                film.setSummary(rs.getString(10));
                al.add(film);
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Film> searchFilmById(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from film where id=?");
            pstmt.setInt(1, id);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Film> searchFilmByName(String name) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from film where name=?");
            pstmt.setString(1, name);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Film> checkFilmByDirectors(String directors) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            directors = "%" + directors + "%";
            pstmt = ct.prepareStatement("select * from film where directors=?");
            pstmt.setString(1, directors);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Film> checkFilmByCasts(String casts) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            casts = "%" + casts + "%";
            pstmt = ct.prepareStatement("select * from film where casts=?");
            pstmt.setString(1, casts);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Film> checkFilmByYear(int year) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from film where year=?");
            pstmt.setInt(1, year);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Film> checkFilmByCountries(String countries) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from film where Countries=?");
            countries = "%" + countries + "%";
            pstmt.setString(1, countries);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Film> checkFilmByType(String type) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from film where type=?");
            type = "%" + type + "%";
            pstmt.setString(1, type);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Film> listAllFilm() {
        ArrayList<Film> al = new ArrayList<Film>();
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from Film");
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateFilm(Film film) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement(
                    "update customer set name=?,img=?,star=?,directors=?,casts=?,year=?,countries=?,type=?,summary=? where id=?");
            pstmt.setString(1, film.getName());
            pstmt.setString(2, film.getImg());
            pstmt.setFloat(3, (float) film.getStar());
            pstmt.setString(4, film.getDirectors());
            pstmt.setString(5, film.getCasts());
            pstmt.setInt(6, film.getYear());
            pstmt.setString(7, film.getCountries());
            pstmt.setString(8, film.getType());
            pstmt.setString(9, film.getSummary());
            pstmt.setInt(10, film.getId());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

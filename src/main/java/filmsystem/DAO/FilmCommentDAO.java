package filmsystem.DAO;

import filmsystem.Model.FilmComment;

import java.sql.*;
import java.util.ArrayList;

public class FilmCommentDAO {
    PreparedStatement pstmt;

    public boolean insertFilmComment(FilmComment filmComment) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("insert into filmcomment (id,userId,filmId,filmstar,comment) values(?,?,?,?,?)");
            pstmt.setInt(1, filmComment.getId());
            pstmt.setInt(2, filmComment.getUserId());
            pstmt.setInt(3, filmComment.getFilmId());
            pstmt.setInt(4, filmComment.getFilmStar());
            pstmt.setString(5, filmComment.getComment());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteFilmComment(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("delete from filmcomment where id=?");
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

    public ArrayList<FilmComment> searchForList() {
        ArrayList<FilmComment> al = new ArrayList<FilmComment>();
        try {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                FilmComment filmComment = new FilmComment();
                filmComment.setId(rs.getInt(1));
                filmComment.setUserId(rs.getInt(2));
                filmComment.setFilmId(rs.getInt(3));
                filmComment.setFilmStar(rs.getInt(4));
                filmComment.setComment(rs.getString(5));
                al.add(filmComment);
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<FilmComment> searchFilmCommentById(int id) {
        try {
            BaseDAO bd = new BaseDAO();
            Connection ct = bd.getConnection();
            pstmt = ct.prepareStatement("select * from filmcomment where id=?");
            pstmt.setInt(1, id);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<FilmComment> searchFilmCommentUserId(int userId) {
        try {
            BaseDAO bd = new BaseDAO();
            Connection ct = bd.getConnection();
            pstmt = ct.prepareStatement("select * from filmcomment where userId=?");
            pstmt.setInt(1, userId);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<FilmComment> searchFilmCommentByFilmId(int filmId) {
        try {
            BaseDAO bd = new BaseDAO();
            Connection ct = bd.getConnection();
            pstmt = ct.prepareStatement("select * from filmcomment where filmId=?");
            pstmt.setInt(1, filmId);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<FilmComment> listAllFilmComment(int filmId) {
        try {
            BaseDAO bd = new BaseDAO();
            Connection ct = bd.getConnection();
            pstmt = ct.prepareStatement("select * from filmcomment");
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public boolean updateFilmComment(FilmComment filmComment) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("update filmcomment set userId=?,filmId=?,filmstar=?,comment=? where id=?)");
            pstmt.setInt(1, filmComment.getUserId());
            pstmt.setInt(2, filmComment.getFilmId());
            pstmt.setInt(3, filmComment.getFilmStar());
            pstmt.setString(4, filmComment.getComment());
            pstmt.setInt(5, filmComment.getId());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

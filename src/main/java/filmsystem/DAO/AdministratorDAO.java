package filmsystem.DAO;

import filmsystem.Model.Administrator;

import java.sql.*;
import java.util.ArrayList;

import filmsystem.DAO.BaseDAO;


public class AdministratorDAO {
    PreparedStatement pstmt;

    public boolean insertAdministrator(Administrator admin) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("insert into administrator (username, password, img) values(?,?,?)");
            pstmt.setString(1, admin.getUsername());
            pstmt.setString(2, admin.getPassword());
            pstmt.setString(3, admin.getImg());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteAdministrator(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("delete from administrator where id=?");
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

    public ArrayList<Administrator> searchForList() {
        ArrayList<Administrator> al = new ArrayList<Administrator>();
        try {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Administrator admin = new Administrator();
                admin.setId(rs.getInt(1));
                admin.setUsername(rs.getString(2));
                admin.setPassword(rs.getString(3));
                admin.setImg(rs.getString(4));
                al.add(admin);
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Administrator> searchAdministratorById(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from administrator where id=?");
            pstmt.setInt(1, id);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Administrator> searchAdministratorByName(String username) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from administrator where username=?");
            pstmt.setString(1, username);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Administrator> listAllAdministrator() {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from administrator");
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateAdministrator(Administrator admin) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement(
                    "update administrator set username=?,password=?,img=? where id=?");
            pstmt.setString(1, admin.getUsername());
            pstmt.setString(2, admin.getPassword());
            pstmt.setString(3, admin.getImg());
            pstmt.setInt(4, admin.getId());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

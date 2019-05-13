package filmsystem.DAO;

import java.sql.*;
import java.util.ArrayList;

import filmsystem.DAO.BaseDAO;
import filmsystem.Model.Customer;

public class CustomerDAO {
    PreparedStatement pstmt;

    public boolean insertCustomer(Customer customer) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement(
                    "insert into customer (username, password, level, gender, phonenum, city) values(?,?,?,?,?,?)");
            pstmt.setString(1, customer.getUsername());
            pstmt.setString(2, customer.getPassword());
            pstmt.setString(3, customer.getImg());
            pstmt.setString(4, customer.getGender());
            pstmt.setString(5, customer.getPhoneNum());
            pstmt.setString(6, customer.getCity());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCustomer(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("delete from customer where id=?");
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

    public ArrayList<Customer> searchForList() {
        ArrayList<Customer> al = new ArrayList<Customer>();
        try {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt(1));
                customer.setUsername(rs.getString(2));
                customer.setPassword(rs.getString(3));
                customer.setImg(rs.getString(4));
                customer.setGender(rs.getString(5));
                customer.setPhoneNum(rs.getString(6));
                customer.setCity(rs.getString(7));
                al.add(customer);
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Customer> searchCustomerById(int id) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from customer where id=?");
            pstmt.setInt(1, id);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Customer> searchCustomerByName(String username) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from customer where username=?");
            pstmt.setString(1, username);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Customer> searchCustomerByCity(String city) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from customer where city=?");
            pstmt.setString(1, city);
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Customer> listAllCustomer() {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement("select * from customer");
            return searchForList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateCustomer(Customer customer) {
        try {
            BaseDAO BD = new BaseDAO();
            Connection ct = BD.getConnection();
            pstmt = ct.prepareStatement(
                    "update customer set username=?,password=?,img=?,gender=?,phonenum=?,city=? where id=?");
            pstmt.setString(1, customer.getUsername());
            pstmt.setString(2, customer.getPassword());
            pstmt.setString(3, customer.getImg());
            pstmt.setString(4, customer.getGender());
            pstmt.setString(5, customer.getPhoneNum());
            pstmt.setString(6, customer.getCity());
            pstmt.setInt(7, customer.getId());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

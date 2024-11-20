package user;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import utils.DButils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;



/**
 *
 * @author Lenovo
 */


public class UserDAO {

    //ky thuat Prepare Statement
    private static final String LOGIN = "SELECT UserID,FullName,RoleID FROM Users WHERE UserID=? AND Password=?";
    private static final String LIST_USER = "SELECT UserID,FullName,RoleID FROM Users WHERE FullName LIKE ?";
    private static final String DELETE = "DELETE Users WHERE UserID=?";
    private static final String UPDATE = "UPDATE Users SET FullName=?, RoleID=? WHERE UserID=?";
    
    private static final String CHECK_DUPLICATE = "SELECT UserID FROM Users WHERE UserID=?";
    private static final String INSERT = "INSERT INTO Users(UserID, FullName, RoleID, Password) VALUES(?,?,?,?)";
    
    
    
    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException {
        UserDTO user = null;

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DButils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID); //? thay bằng 1
                ptm.setString(2, password);// ? thay bằng 2
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("FullName");
                    String roleID = rs.getString("RoleID");
                    
                    user = new UserDTO(userID, fullName, roleID, password);
                }
            }
        }finally { // Close connection, bắt buộc theo thứ tự
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null)  conn.close();
        }
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException, ClassNotFoundException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DButils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_USER);
                ptm.setString(1, "%" + search + "%"); //LIKE %string% ~datatype gan giong
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String fullName = rs.getString("FullName");
                    String roleID = rs.getString("RoleID");
                    String password = "***";
                    list.add(new UserDTO(userID, fullName, roleID, password));
                }
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null)  conn.close();
        }
        return list;
    }
    
    //Những hàm CRUD không cần Khai báo RESULT SET.
    public boolean delete(String userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DButils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (conn != null) conn.close();
            if (ptm != null) ptm.close();        
        }
        return check;
    }
    
    public boolean update(UserDTO user) throws SQLException, ClassNotFoundException{
        boolean check=false;
        
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DButils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getRoleID());
                ptm.setString(3, user.getUserID());
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (conn != null) conn.close();
            if (ptm != null)  ptm.close();     
        }
        return check;
    }
    
    public boolean checkDuplicate(String userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DButils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
            
        }finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null)  conn.close();
        }
        return check;
    }

    public boolean insert(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DButils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPassword());
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (conn != null) conn.close();
            if (ptm != null)  ptm.close();
        }
        return check;
    }
    
    
    //----------------------------------------------------------------------------------
    
    
    private static final String GET_USER_BY_ID = "SELECT * FROM Users WHERE UserID = ?";

    public UserDTO getUserByID(String userID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DButils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(GET_USER_BY_ID);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("FullName");
                    String roleID = rs.getString("RoleID");
                    String password = rs.getString("Password");
                    user = new UserDTO(userID, fullName, roleID, password);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
        return user;
    }

}

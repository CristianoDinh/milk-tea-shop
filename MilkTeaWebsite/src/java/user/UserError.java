/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author BaoDinh
 */
public class UserError {
    private String userIDError;
    private String fullNameError;
    private String roleIDError;
    private String passwordError;
    private String confirmError;
    private String error;

    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.roleIDError = "";
        this.passwordError = "";
        this.confirmError = "";
        this.error = "";
    }
    public UserError(String userIDError, String fullNameError, String roleIDError, String passwordError, String confirmError, String error) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.error = error;
    }
    

    //Getter: dùng để khi muốn lấy/hiển thị ra lỗi
    public String getError() {    
        return error;
    }
    public String getUserIDError() {    
        return userIDError;
    }
    public String getFullNameError() {
        return fullNameError;
    }
    public String getConfirmError() {
        return confirmError;
    }
    
    //Setter: dùng khi muốn set/đặt/gán lỗi
    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }
    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }
    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }
    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }
    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }
    public void setError(String error) {
        this.error = error;
    }
    
    
}

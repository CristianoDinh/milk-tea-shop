
package drinks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DButils;

/**
 *
 * @author BaoDinh
 */
public class DrinksDAO {
    private static final String LIST_DRINKS = "SELECT DrinksID,DrinksName,Quantity,UnitPrice FROM Drinks WHERE Quantity > 0";
    
    public List<DrinksDTO> getListDrinks() throws SQLException, ClassNotFoundException {
        List<DrinksDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DButils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_DRINKS);
                //ptm.setString(1, "%" + search + "%"); 
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String drinksID = rs.getString("DrinksID");
                    String drinksName = rs.getString("DrinksName");
                    int quantity = rs.getInt("Quantity");
                    Double unitPrice = rs.getDouble("UnitPrice");
                    
                    list.add(new DrinksDTO(drinksID, drinksName, quantity, unitPrice));
                }
            }
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null)  conn.close();
        }
        return list;
    }
    
}

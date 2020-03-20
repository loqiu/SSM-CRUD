import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author loqiu
 * @date 2020-03-14-20:13
 */
public class Test {
    @org.junit.Test
    public void test() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssmbuild","root","123456");
            System.out.println("conn = " + conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

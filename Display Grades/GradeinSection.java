import java.sql.*;
import javax.swing.JOptionPane;

public class GradeInSection {

    public static void main(String[] args) throws ClassNotFoundException,
                                                    SQLException {
        int section;
        String currentGrade;
        int currentCount;

	String letter="ABCDE";
        int total=0;
        int i=0;
        
        Class.forName("oracle.jdbc.OracleDriver");
        
        Connection c = 
            DriverManager.getConnection("jdbc:oracle:thin:@140.192.30.237:1521:def",
                                         "*******","*******");
       
        section = Integer.parseInt(JOptionPane.showInputDialog("Enter SectionID:"));
       
        if (section != 0) {
            Statement s = c.createStatement();
            System.out.println("Section " + section);
            ResultSet r;
            r = s.executeQuery("SELECT Grade,Count(Grade) FROM GRADING " + 
                 "WHERE SectionID="+ section + " GROUP BY Grade ORDER BY Grade");

            while (r.next()) {
                currentGrade = r.getString(1);
                while (!currentGrade.equals(letter.substring(i,i+1))) {
                    System.out.println(letter.substring(i,i+1) + "\'s: 0");
                    i++;
                    if (i==5) break;
                }
                currentCount = r.getInt(2);
                System.out.println(currentGrade + "\'s: " + currentCount);
                total += currentCount;
                i++;
            }

            while (i<5) {
                System.out.println(letter.substring(i,i+1) + "\'s: 0");
                i++;
            }
            System.out.println("Total grades: " + total);
        }

        c.close();
    }
}
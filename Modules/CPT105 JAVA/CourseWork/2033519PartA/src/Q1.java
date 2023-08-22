import javax.swing.*;
import java.awt.*;
/**
 * Visualize unpacking and packing of a single string using JFrame.
 * @author Zhenpeng.LIU20
 */
public class Q1 {
    public static void main(String[] args) {
        JFrame window1 = new JFrame("Data Packet Convert");//creat the frame window
        window1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //Declare related components.
        JLabel Raw_Jlabel = new JLabel("Raw data:");
        JLabel Package_Jlabel= new JLabel("Data package:");
        JTextField Raw_Text = new JTextField();
        JTextField Packet_Text = new JTextField();
        JButton Data_to_package = new JButton("Data to package");
        JButton Package_to_data = new JButton("Package to data");
        //Write component method.
        Data_to_package.addActionListener((e)->{
            try {
                Packet_Text.setText(new DataPacket().convertToDataPacket(Raw_Text.getText()));
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null,ex.toString(), "Error Message:",JOptionPane.ERROR_MESSAGE);
            }
        });
        Package_to_data.addActionListener((e)->{
            try {
                Raw_Text.setText(new DataPacket().getDataFromDataPacket(Packet_Text.getText()));
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null,ex.toString(), "Error Message:",JOptionPane.ERROR_MESSAGE);
            }
        });
        //Confirm the intermediate form.
        Panel centre = new Panel();
        centre.setLayout(new GridLayout(3,2,20,20));
        centre.add(Raw_Jlabel);
        centre.add(Raw_Text);
        centre.add(Package_Jlabel);
        centre.add(Packet_Text);
        centre.add(Data_to_package);
        centre.add(Package_to_data);

        window1.add(new JLabel("\r\r"),BorderLayout.NORTH);
        window1.add(new JLabel("\r\r"),BorderLayout.SOUTH);
        window1.add(new JLabel("      "),BorderLayout.WEST);
        window1.add(new JLabel("      "),BorderLayout.EAST);
        window1.add(centre,BorderLayout.CENTER);

        window1.setSize(400,250);
        window1.setVisible(true);
    }
}

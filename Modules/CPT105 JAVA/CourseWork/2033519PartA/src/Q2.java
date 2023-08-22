import javax.swing.*;
import java.awt.*;

public class Q2 {
    /**
     * Visualize unpacking and packing of a series string using JFrame.
     * @author Zhenpeng.LIU20
     */
    public static void main(String[] args) {
        JFrame window2 = new JFrame("Multiple Data Package Convert");//creat the frame window
        window2.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //write component method.
        JLabel Info_Jlabel = new JLabel("<html><body>Name:Zhenpeng LIU20<br>Gender:Male<br>StuID:2033519<body></html>");
        
        ImageIcon image = new ImageIcon("lzpp.jpg");//图像测试
        image.setImage(image.getImage().getScaledInstance(86,108,Image.SCALE_DEFAULT));
        JLabel lzpp_jpg = new JLabel();//image
        lzpp_jpg.setIcon(image);



        JLabel Raw1_Jlabel = new JLabel("Raw data 1:");
        JLabel Raw2_Jlabel = new JLabel("Raw data 2:");
        JLabel Raw3_Jlabel = new JLabel("Raw data 3:");
        JLabel MutliPackage_Jlabel= new JLabel("Multi data package:");
        JTextField Raw1_Text = new JTextField();
        JTextField Raw2_Text = new JTextField();
        JTextField Raw3_Text = new JTextField();
        JTextField MultiPacket_Text = new JTextField();
        JButton Data_to_multi_package = new JButton("Data to multi package");
        JButton Multi_package_to_data = new JButton("Multi package to data");
        //Write component method.
        Data_to_multi_package.addActionListener((e)->{
            String[] Data = {Raw1_Text.getText(),Raw2_Text.getText(),Raw3_Text.getText()};
            try {
                MultiPacket_Text.setText(new MultiDataPacket().convertToDataPacket(Data));
            } catch ( DataPacketException ex) {
                JOptionPane.showMessageDialog(null,ex.toString(), "Error Message:",JOptionPane.ERROR_MESSAGE);
            }
        });
        Multi_package_to_data.addActionListener((e)->{
            try {
                String[] Raw = new MultiDataPacket().getMultiDataFromHexDataPacket(MultiPacket_Text.getText());
                Raw1_Text.setText(Raw[0]);
                Raw2_Text.setText(Raw[1]);
                Raw3_Text.setText(Raw[2]);
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null,ex.toString(), "Error Message:",JOptionPane.ERROR_MESSAGE);
            }
        });
        //Confirm the intermediate form.
        JPanel centre = new JPanel();
        centre.setLayout(new GridLayout(6,2,20,20));
        centre.add(Info_Jlabel);
        centre.add(lzpp_jpg);
        centre.add(Raw1_Jlabel);
        centre.add(Raw1_Text);
        centre.add(Raw2_Jlabel);
        centre.add(Raw2_Text);
        centre.add(Raw3_Jlabel);
        centre.add(Raw3_Text);
        centre.add(MutliPackage_Jlabel);
        centre.add(MultiPacket_Text);
        centre.add(Data_to_multi_package);
        centre.add(Multi_package_to_data);


        window2.add(new JLabel("\r\r"),BorderLayout.NORTH);
        window2.add(new JLabel("\r\r"),BorderLayout.SOUTH);
        window2.add(new JLabel("      "),BorderLayout.WEST);
        window2.add(new JLabel("      "),BorderLayout.EAST);
        window2.add(centre,BorderLayout.CENTER);

        window2.setSize(400,750);
        window2.setVisible(true);
    }
}

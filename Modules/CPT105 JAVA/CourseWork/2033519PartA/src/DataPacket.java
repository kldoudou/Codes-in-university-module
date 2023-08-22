
import java.nio.charset.StandardCharsets;

/**
 * {@inheritDoc}
 * This Object can convert between string and DataPacket.
 * @author Zhenpeng.LIU20
 */

public class DataPacket {
    /**
     * counterID counts the times of DataPacketException throwed.
     */
    public static int counterID = 0;

    /**
     * convert an array of common strings to an array of hexadecimal strings.
     * @param str is the string need convert to hexadecimal string.
     * @return hexadecimal string converted.
     * @throws DataPacketException - If input is not in US-ASCII hexadecimal string.
     */
    protected String stringToHex(String str) throws DataPacketException {
        for (int i = 0; i < str.length(); i++) {
            if(!StandardCharsets.US_ASCII.newEncoder().canEncode(str.charAt(i))){
                counterID++;
                throw new DataPacketException(counterID,"input in not in US_ASCII");
            }
        }
        byte[] str_to_byte = str.getBytes(StandardCharsets.US_ASCII);
        String str_hex = "";
        for (int i = 0; i < str.length(); i++) {
            str_hex = str_hex.concat(String.format("%2X",str_to_byte[i]));
        }
        return str_hex;
    }

    /**
     * Encapsulate a string into a data packet and return a hexadecimal string.
     * @param data is the string need to be packaged.
     * @return the Data packaged.
     * @throws DataPacketException - If the data input is too long or something wrong about its CRC16.
     * @see CRC16
     */
    public String convertToDataPacket(String data) throws DataPacketException {
        if(data.length()>99){
            counterID++;
            throw new DataPacketException(counterID,"convertToDataPacket:too long dataInput");
        }
        String HexString = this.stringToHex(data);
        try {
            return "AA" + String.format("%02d", data.length()) + HexString + CRC16.getCRC(HexString) + "BB";
        }catch (DataPacketException e){
            counterID++;
            throw new DataPacketException(counterID,"CRC16's get is wrong");
        }
    }

    /**
     * Retrieve string data from a hexadecimal string of a data packet.
     * @param hexData is the DataPacket need to convert.
     * @return The String converted by hexData.
     * @throws DataPacketException - If input is not a compliant DataPacket.
     * @see CRC16
     */
    public String getDataFromDataPacket(String hexData) throws DataPacketException{
        int len = hexData.length();//the length of hexData
        if(!hexData.startsWith("AA")){//check "AA"
            counterID++;
            throw new DataPacketException(counterID,"getDataFromDataPacket problem:Not start with AA");
        }
        if(!hexData.endsWith("BB")){//check "BB"
            counterID++;
            throw new DataPacketException(counterID,"getDataFromDataPacket problem:Not end with BB");
        }
        try{
            if(hexData.substring(4,len-6).length()!=Integer.parseInt(hexData.substring(2,4))*2){//check length
                counterID++;
                throw new DataPacketException(counterID,"getDataFromDataPacket problem:length is not match");
            }
        }catch (NumberFormatException e){//check the length part
            counterID++;
            throw new DataPacketException(counterID,"getDataFromDataPacket problem:Wrong format of hexData input");
        }
        if(!CRC16.getCRC(hexData.substring(4,len-6)).equals(hexData.substring(len-6,len-2))){//check CRC
            counterID++;
            throw new DataPacketException(counterID,"getDataFromDataPacket problem:hexString not match its CRC");
        }
        byte[] str_bi = new byte[(hexData.length()-10)/2];//to store the char
        for (int i = 0; i < str_bi.length; i++) {
            str_bi[i] = (byte)Integer.parseInt(hexData.substring(2*i+4,2*i+6),16);//split hexData middle part，and input to it with decimal.
        }
        return new String(str_bi,StandardCharsets.US_ASCII);//creat a new string by these bytes.
    }
}

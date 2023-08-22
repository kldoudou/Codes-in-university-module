/**
 * This object can get a CRC16
 * @author CPT105 teacher, Zhenpeng.LIU20
 */
public class CRC16 {
    /**
     * This method return the CRC of the byte[].
     * @param bytes encoded by String by using ASCII.
     * @return 2 bytes CRC code from a byte array.
     */
    private static String getCRC(byte[] bytes){
        int CRC = 0X0000FFFF;
        final int POLYNOMIAL=0X0000A001;
        int i,j;
        for (i = 0; i < bytes.length; i++) {
            CRC = CRC^((int)(bytes[i] & 0x000000ff));
            for (j = 0; j < 8; j++) {
                if((CRC &0X00000001)!=0){
                    CRC = CRC>>1;
                    CRC = CRC^POLYNOMIAL;
                }
                else{
                    CRC = CRC>>1;
                }
            }
        }
        String result = Integer.toHexString(CRC).toUpperCase();
        if(result.length()!=4){
            StringBuffer sb = new StringBuffer("0000");
            result = sb.replace(4-result.length(),4,result).toString();
        }
        return result.substring(2,4)+result.substring(0,2);
    }

    /**
     * This method return the CRC of the String.
     * @param hexData need to get CRC.
     * @return the String's CRC.
     * @throws DataPacketException on input error.
     */
    public static String getCRC(String hexData) throws DataPacketException{
        if(hexData.length()%2!=0){
            throw new DataPacketException();
        }
        byte[] str_by = new byte[hexData.length()/2];//creat a array to store decimal two-digit number
        for (int i = 0; i < str_by.length; i++) {

            if (!hexData.substring(2*i,2*i+2).matches("[0-7][0-9[A-F]]")){//in case there are something in hexData is not hexadecimal
                throw new DataPacketException();
            }

            str_by[i] = (byte)Integer.parseInt(hexData.substring(2*i,2*i+2),16);//Take the hexData apart in pairs and put it in decimal.
        }
        return getCRC(str_by);
    }
}

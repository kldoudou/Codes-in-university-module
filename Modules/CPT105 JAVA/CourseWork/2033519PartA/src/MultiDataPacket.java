/**
 * This Object can convert between strings and MultiDataDataPacket.
 * @author Zhenpeng.LIU20
 */
public class MultiDataPacket extends DataPacket{
    /**
     * Convert strings into hexadecimal strings.
     * It is not used in this object, but can be inherited.
     * @param str to be converted.
     * @return the string converted.
     * @throws DataPacketException - if input is not in US-ASCII hexadecimal string
     */
    protected String[] stringToHex(String[] str) throws DataPacketException {
        String[] arrHex = new String[str.length];
        for (int i = 0; i < str.length; i++) {
            arrHex[i] = super.stringToHex(str[i]);
        }
        return arrHex;
    }

    /**
     * convert an array of common strings to a MultiDataPacket with a single hexadecimal string.
     * @param data need to be converted.
     * @return Data Packaged.
     * @throws DataPacketException - if the data input is too long or something wrong about its CRC16.
     */
    public  String convertToDataPacket(String[] data) throws DataPacketException{
        String toHexPacket = "";
        for (int i = 0; i < data.length; i++) {
            if(i==0){
                toHexPacket = toHexPacket.concat(super.convertToDataPacket(data[i]));
            }else {
                toHexPacket = toHexPacket.concat(" " + super.convertToDataPacket(data[i]));
            }
        }
        return toHexPacket;
    }

    /**
     * Retrieve and return several data from theMultiDataPacket string.
     * @param hexData is the MultiDataPacket need to convert.
     * @return The String[] converted by hexData.
     * @throws DataPacketException - if input is not a compliant MultiDataPacket.
     */
    public String[] getMultiDataFromHexDataPacket(String hexData) throws DataPacketException{
        String[] data = hexData.split("[ ]");
        for (int i = 0; i < data.length; i++) {
            data[i] = super.getDataFromDataPacket(data[i]);
        }
        return data;
    }
}

/**
 * The class DataPacketException produced by fail or interrupted DataPacket problems.
 * @author Zhenpeng.LIU20
 */
public class DataPacketException extends Exception {
    private int id = 0;
    private String message;
    public DataPacketException(){
    }
    public DataPacketException(int id, String message) {
        this.id = id;
        this.message = message;
    }
    public int getId() {
        return id;
    }
    @Override
    public String toString(){
        return "DataPackageException:Exception Id="+id+", Exception Message="+message;
    }
}

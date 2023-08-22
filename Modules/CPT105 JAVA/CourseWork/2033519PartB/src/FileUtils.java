import java.io.*;
import java.util.ArrayList;

/**
 * This object can create plain text files to save objects of students, teachers, courses and grades.
 * This object can retrieve objects from save files.
 * @author Zhenpeng.LIU20
 */
public class FileUtils {
    /*
      static use creatNewEmptyFile.
     */
    static{
        try {
            creatNewEmptyFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method can creat new save files if they are now exist.
     * @throws IOException - if meet problems when creatNewFile.
     * @see IOException
     */
    @SuppressWarnings("all")
    public static void creatNewEmptyFile() throws IOException{
        File save = new File("save");
        File stu_save = new File("save" + File.separator + "Student_save.txt");
        File cou_save = new File("save" + File.separator + "Course_save.txt");
        File tea_save = new File("save" + File.separator + "Teacher_save.txt");
        File gra_save = new File("save" + File.separator + "Grade_save.txt");
        if(!save.isDirectory()){
            save.mkdir();
        }
        if(!stu_save.isFile()){
            stu_save.createNewFile();
        }
        if(!cou_save.isFile()){
            cou_save.createNewFile();
        }
        if(!tea_save.isFile()){
            tea_save.createNewFile();
        }
        if(!gra_save.isFile()){
            gra_save.createNewFile();
        }
    }

    /**
     * This method can save Data to the save file.
     * @param obj will be saved in "save" directory.
     * @throws IOException if the save directory is not exist.
     */
    public static void editNewInfo(Object obj) throws IOException{
        if(!(new File("save").isDirectory())){
            throw new IOException("Data lose!!!");
        }
        try{
            FileOutputStream fos = new FileOutputStream("save" + File.separator + obj.getClass().getName() + "_save.txt",true);
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(obj);
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * Read the data of the kind input in their save files and save them in an Arraylist.
     * @param clazz is the kind of data need to read.
     * @param <T> is the kind of Info to define to feedback.
     * @return ArrayList it reads.
     * @throws IOException - if wrong kindObject of input.
     */
    public  static <T> ArrayList<T> ViewInfo(Class<T> clazz) throws IOException {

        File open_save = new File("save" + File.separator + clazz.getName() +"_save.txt");
        if(!open_save.isFile()){
            throw new IOException("Wrong kindObject of input");
        }
        ArrayList<T> list = new ArrayList<>();
        try{
            Object obj = null;
            ObjectInputStream ois = null;
            FileInputStream fis = new FileInputStream(open_save);
            while(fis.available()>0){
                ois = new ObjectInputStream(fis);
                obj = ois.readObject();
                list.add((T) obj);
            }
            if (ois != null) {
                ois.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

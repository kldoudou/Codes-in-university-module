import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

/**
 * This part can handle with the information.
 * @author Zhenpeng.LIU20
 */
public class DataAccess {
    /**
     * This method can store the data inputted.
     * @param clazz The kind of Info need to store.
     * @param <T> The kind of Info to define in running.
     * @return true if  id input is "-1", false in other cases.
     * @throws IOException if meet problems when store data.
     */
    public static <T> boolean addInfo(Class<T> clazz) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.println("Please input " + clazz.getName() + " information (input '-1' to end):");
        if(clazz.getName().equals("Grade")) {
            System.out.println("input Student Id:");
        }
        else {
            System.out.print("input " + clazz.getName() + " Id:");
        }
        String idStr = sc.nextLine();
        if (idStr.equals("-1")) {
            System.out.println("press any key to continue...");
            System.in.read();
            return false;
        }
        int id = 0;
        try{
            id = Integer.parseInt(idStr);
            if(idStr.charAt(0) == '0'){
                throw new NumberFormatException();
            }
        }catch(NumberFormatException e){
            System.out.println("id should be a number with first digit of it is not 0, please input again.");
            return true;
        }

        if(id<=0){
            System.out.println("Id should be a positive number, please input again.");
            return true;
        }
        if (getInfoById(clazz,id)) {
            System.out.println("and this ID has been exist");
            return true;
        }
        switch(clazz.getName()){
            case "Grade":
                System.out.print("input Course Id:");
                String cou_idStr = sc.nextLine();
                int cou_id = 0;
                try{
                    cou_id = Integer.parseInt(cou_idStr);
                    if(idStr.charAt(0) == '0'||cou_id<=0){
                        throw new NumberFormatException();
                    }
                }catch(NumberFormatException e){
                    System.out.println("Courseid should be a positive number with first digit of it is not 0, please input again.");
                    return true;
                }

                System.out.print("input Course grade:");
                String gradeStr = sc.nextLine();
                int grade = 0;
                try{
                    grade = Integer.parseInt(gradeStr);
                    if(grade<0){
                        throw new NumberFormatException();
                    }
                }catch (NumberFormatException e){
                    System.out.println("The grade should be non-negative number with first digit of it is not 0, please input again.");
                    return true;
                }

                Grade graInfo = new Grade(id, cou_id, grade);
                FileUtils.editNewInfo(graInfo);
                return true;
            case "Course":
                System.out.print("Input Course name:");
                String course_name = sc.nextLine();
                Course couInfo = new Course(id, course_name);
                FileUtils.editNewInfo(couInfo);
                return true;
            default:
                break;
        }

        System.out.print("Input "+ clazz.getName() +" name:");
        String name = sc.nextLine();

        String gen;
        Gender gender;
        stu_gen:
        while (true) {
            System.out.print("input "+ clazz.getName()+" gender (M/F):");
            gen = sc.nextLine();
            switch (gen) {
                case "M":
                    gender = Gender.male;
                    break stu_gen;
                case "F":
                    gender = Gender.female;
                    break stu_gen;
                default:
                    System.out.println("Wrong input of gender");
            }
        }
        switch (clazz.getName()) {
            case "Student":
                Student stuInfo = new Student(id, name, gender);
                FileUtils.editNewInfo(stuInfo);
                return true;
            case "Teacher":
                System.out.print("Input Teacher logName:");
                String tea_loginName = sc.nextLine();
                System.out.print("Input Teacher logPassword:");
                String tea_password = sc.nextLine();
                Teacher teaInfo = new Teacher(id, name, gender, tea_loginName, tea_password);
                FileUtils.editNewInfo(teaInfo);
                return true;
            default:
                throw new IOException("Wrong Object input");
        }
    }

    /**
     * It can show all the information in the kind of information need to show.
     * @param clazz The kind of information need to show.
     * @param <T> The kind of Info to define in running.
     * @throws IOException if meet problems.
     */
    public static <T> void showInfo(Class<T> clazz) throws IOException {
        ArrayList<T> show = FileUtils.ViewInfo(clazz);
        if (show.isEmpty()) {
            System.out.println("There is no " + clazz.getName() + ".");
        } else {
            System.out.println(show);
        }
        System.out.println("press any key to continue...");
        System.in.read();
    }

    /**
     *
     * @param clazz The kind of information need to search.
     * @param Id the id need to look for.
     * @param <T> The kind of Info to define in running.
     * @return true if search successfully; false if fail to search.
     * @throws IOException if meet problems.
     */
    public static <T> boolean getInfoById(Class<T> clazz,int Id) throws IOException {
        ArrayList<T> out = FileUtils.ViewInfo(clazz);
        switch (clazz.getName()) {
            case "Student":
                for (int i = 0; i < out.size(); i++) {
                    if (((Student) out.get(i)).getStudentID()==Id){
                        System.out.println("the Student information is:"+out.get(i));
                        return true;
                    }
                }
                break;
            case "Teacher":
                for (int i = 0; i < out.size(); i++) {
                    if(((Teacher) out.get(i)).getTeacherID()==Id){
                        System.out.println("The Teacher information is: "+out.get(i));
                        return true;
                    }
                }
                break;
            case "Course":
                for (int i = 0; i < out.size(); i++) {
                    if(((Course) out.get(i)).getCourseId()==Id){
                        System.out.println("The Course information is: "+out.get(i));
                        return true;
                    }
                }
                break;
            case "Grade":
                for (int i = 0; i < out.size(); i++) {
                    if(((Grade) out.get(i)).getStuID()==Id){
                        System.out.println("The Grade information is: "+out.get(i));
                        return true;
                    }
                }
                break;
            default:
                throw new IOException("Wrong input of object");
        }
        return false;
    }
}
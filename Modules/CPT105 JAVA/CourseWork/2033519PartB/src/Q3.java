import java.util.Scanner;
/**
 * It will show the part of operation interface.
 * @author Zhenpeng.LIU20
 */
public class Q3 {
    public static void menu(){
        System.out.print("""
                ***** Operation Menu *****
                1: add a student.
                2: add a course.
                3: add a teacher.
                4: add a grade.
                5: list all students.
                6: list all courses.
                7: list all teachers.
                8: list all grades.
                9: search a student.
                10: search a course.
                11: search a teacher.
                12: search a grade.
                0: exist the program.
                """);
    }
    @SuppressWarnings("all")
    public static void main(String[] args) throws Exception {
        while (true) {
            menu();
            System.out.println("Please input a number to run the program");
            Scanner sc = new Scanner(System.in);
            int key = 0;
            try{
                key = sc.nextInt();
            }catch (Exception e){
                System.out.println("Wrong input, try again.");
                continue;
            }
            sc.nextLine();
            switch (key) {
                case 1://add a new student
                    while (DataAccess.addInfo(Student.class));
                    break;
                case 2://add a new course
                    while (DataAccess.addInfo(Course.class));
                    break;
                case 3://add a new teacher
                    while(DataAccess.addInfo(Teacher.class));
                    break;
                case 4://add a new grade
                    while(DataAccess.addInfo(Grade.class));
                    break;
                case 5://list all students.
                    DataAccess.showInfo(Student.class);
                    break;
                case 6://list all courses.
                    DataAccess.showInfo(Course.class);
                    break;
                case 7://list all teachers.
                    DataAccess.showInfo(Teacher.class);
                    break;
                case 8://list all grades.
                    DataAccess.showInfo(Grade.class);
                    break;
                case 9://search a student.
                    System.out.print("Input student ID for search:");
                    String stuId = sc.nextLine();
                    if(!DataAccess.getInfoById(Student.class,Integer.parseInt(stuId))){
                        System.out.println("no student found");
                    }
                    System.out.println("press any key to continue...");
                    System.in.read();
                    break;
                case 10://search a course.
                    System.out.print("Input course ID for search:");
                    String courseId = sc.nextLine();
                    if(!DataAccess.getInfoById(Course.class,Integer.parseInt(courseId))){
                        System.out.println("no course found");
                    }
                    System.out.println("press any key to continue...");
                    System.in.read();
                    break;
                case 11://search a teacher.
                    System.out.print("Input teacher ID for search:");
                    String teacherId = sc.nextLine();
                    if(!DataAccess.getInfoById(Teacher.class,Integer.parseInt(teacherId))){
                        System.out.println("no teacher found");
                    }
                    System.out.println("press any key to continue...");
                    System.in.read();
                    break;
                case 12://search a grade.
                    System.out.print("Input student ID for search:");
                    String stu_forCouId = sc.nextLine();
                    if(!DataAccess.getInfoById(Grade.class,Integer.parseInt(stu_forCouId))){
                        System.out.println("no grade found");
                    }
                    System.out.println("press any key to continue...");
                    System.in.read();
                    break;
                case 0://exit
                    System.exit(0);
                    break;
                default:
                    System.out.println("Wrong input, try again");
                    break;
            }
        }
    }
}

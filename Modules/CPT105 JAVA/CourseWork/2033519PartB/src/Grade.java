import java.io.Serializable;

/**
 * This class provides Grade class implements Serializable.
 * It has Integer stuID; Integer courseID; Integer grade.
 */
public class Grade implements Serializable {
    private int stuID;
    private int courseID;
    private int grade;

    public Grade(int stuID, int courseID, int grade) {
        this.stuID = stuID;
        this.courseID = courseID;
        this.grade = grade;
    }

    public int getStuID() {
        return stuID;
    }

    @Override
    public String toString() {
        return stuID + " " + courseID + " " + grade;
    }
}

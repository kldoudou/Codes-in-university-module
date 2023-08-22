import java.io.Serializable;

/**
 * This class provide Course Object implements Serializable.
 * It has Integer:courseID; String courseName
 */
public class Course implements Serializable {
    private int courseId;
    private String courseName;

    public int getCourseId() {
        return courseId;
    }

    public Course(int courseId, String courseName) {
        this.courseId = courseId;
        this.courseName = courseName;
    }

    @Override
    public String toString() {
        return courseId + " " + courseName;
    }
}

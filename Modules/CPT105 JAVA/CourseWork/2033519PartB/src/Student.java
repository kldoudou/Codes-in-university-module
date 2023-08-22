/**
 * {@inheritDoc}
 * It has another Integer studentID.
 */
public class Student extends Person{
    private int studentID;
    public int getStudentID() {
        return studentID;
    }
    public Student(int stuID,String name,Gender gender) {
        this.studentID = stuID;
        this.name = name;
        this.gender = gender;
    }

    @Override
    public String toString() {
        return studentID + " " + super.toString();
    }
}

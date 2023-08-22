import java.security.GeneralSecurityException;

/**
 * {@inheritDoc}
 * It also has Integer teacherID; String loginName; String password;
 * The password will be encrypted, and will be decrypted in toString.
 */
public class Teacher extends Person {


    private int teacherID;
    private String loginName;
    private String password;

    public int getTeacherID() {
        return teacherID;
    }
    public Teacher(int teacherID, String name, Gender gender, String loginName, String password) {
        this.teacherID = teacherID;
        this.name = name;
        this.gender = gender;
        this.loginName = loginName;
        try {
            this.password = Encryption.encrypt(password);
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String toString() {
        try {
            return teacherID + " " + super.toString() + " " + loginName + " " + Encryption.decrypt(password);
        } catch (GeneralSecurityException e) {
            return e.toString();
        }
    }
}

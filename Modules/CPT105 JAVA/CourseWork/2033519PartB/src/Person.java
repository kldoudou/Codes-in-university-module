import java.io.Serializable;

/**
 * The Gender has two cases: male/female
 */
enum Gender{
    male, female
}

/**
 * This class provides Person class implements Serializable.
 * it has String name; Gender gender;
 */
public class Person implements Serializable {
    protected String name;
    protected Gender gender;

    @Override
    public String toString() {
        return name + " " + gender;
    }
}

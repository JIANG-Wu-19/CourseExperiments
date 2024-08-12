package Student_score;

public class Student {
    private String name;
    private String snumber;
    private String course;
    private String score;


    public Student(String name, String snumber, String course, String score) {
        this.name = name;
        this.snumber = snumber;
        this.course = course;
        this.score = score;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSnumber() {
        return snumber;
    }

    public void setSnumber(String snumber) {
        this.snumber = snumber;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}

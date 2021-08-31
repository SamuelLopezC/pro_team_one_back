package org.generation.Osar.users;
import javax.persistence.*;
// DB Psswd = nbk250812

@Entity
@Table(name="usuario")
public class User { // Plan Old Java Object - POJO
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name="idusuario", unique=true, nullable=false)
    private Long idUser;
    @Column(name="nombrecompleto", nullable = false)
    private String fullName;
    @Column(name="tipopersona", nullable = false)
    private String personType;
    @Column(name="edad", nullable = false)
    private int age;
    @Column(name="email", nullable = false)
    private String email;
    @Column(name="password", nullable = false)
    private String password;
    @Column(name="tipousuario", nullable = false)
    private String userType;

    public User(Long idUser, String fullName, String personType, int age,
                String email, String password, String userType) {
        this.idUser = idUser;
        this.fullName = fullName;
        this.personType = personType;
        this.age = age;
        this.email = email;
        this.password = password;
        this.userType = userType;
    } // ends constructor

    public User() {
    } // ends default constructor

    public Long getIdUser() {
        return idUser;
    } // ends getIdUser method

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    } // ends setIdUser method

    public String getFullName() {
        return fullName;
    } // ends getFullName method

    public void setFullName(String fullName) {
        this.fullName = fullName;
    } // ends setFullName method

    public String getPersonType() {
        return personType;
    } // ends getPersonType method

    public void setPersonType(String personType) {
        this.personType = personType;
    } // ends setPersonType method

    public int getAge() {
        return age;
    } // ends getAge method

    public void setAge(int age) {
        this.age = age;
    } // ends setAge method

    public String getEmail() {
        return email;
    } // ends getEmail method

    public void setEmail(String email) {
        this.email = email;
    } // ends setEmail method

    public String getPassword() {
        return password;
    } // ends getPassword method

    public void setPassword(String password) {
        this.password = password;
    } // ends setPassword method

    public String getUserType() {
        return userType;
    } // ends getUserType method

    public void setUserType(String userType) {
        this.userType = userType;
    } // ends setUserType method

    @Override
    public String toString() {
        return "User{" +
                "idUser=" + idUser +
                ", fullName='" + fullName + '\'' +
                ", personType='" + personType + '\'' +
                ", age=" + age +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", userType='" + userType + '\'' +
                '}';
    } // ends toString metho

}


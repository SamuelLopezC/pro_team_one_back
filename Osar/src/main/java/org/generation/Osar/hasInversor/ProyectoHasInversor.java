package org.generation.Osar.hasInversor;


import javax.persistence.*;



@Entity
@Table(name="proyecto_has_inversor")
public class ProyectoHasInversor {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name="idproyectoinversion", unique = true, nullable = false)
    private Long idproyectoinversion;
    @Column(name="inversoridusuario", nullable = false)
    private String inversoridusuario;
    @Column(name="proyectoidproyecto", nullable = false)
    private String proyectoidproyecto;

    public ProyectoHasInversor(Long idproyectoinversion, String inversoridusuario, String proyectoidproyecto) {
        this.idproyectoinversion = idproyectoinversion;
        this.inversoridusuario = inversoridusuario;
        this.proyectoidproyecto = proyectoidproyecto;
    }//constructor

    public ProyectoHasInversor(){}//constructor por default

    public Long getIdproyectoinversion() {
        return idproyectoinversion;
    }//getidporyectoinversion


    public String getInversoridusuario() {
        return inversoridusuario;
    }//getinversoridusuario


    public String getProyectoidproyecto() {
        return proyectoidproyecto;
    }//getproyectoidproyecto

    @Override
    public String toString() {
        return "ProyectoHasInversor{" +
                "idproyectoinversion=" + idproyectoinversion +
                ", inversoridusuario='" + inversoridusuario + '\'' +
                ", proyectoidproyecto='" + proyectoidproyecto + '\'' +
                '}';
    }
}//pojo

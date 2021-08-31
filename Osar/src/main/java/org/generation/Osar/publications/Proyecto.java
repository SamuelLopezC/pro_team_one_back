package org.generation.Osar.publications;

import javax.persistence.*;

@Entity
@Table(name="proyecto")
public class Proyecto {

    @Id//llave privada de la clase User
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name="idproyecto", unique = true, nullable = false)
    private Long idproyecto;
    @Column(name="name", nullable = false)
    private String name;
    @Column(name="fechainicio", nullable = false)
    private String fechainicio;
    @Column(name="fechatermino", nullable = false)
    private String fechatermino;
    @Column(name="imagen", nullable = false)
    private String imagen;
    @Column(name="descripcion", nullable = false)
    private String descripcion;
    @Column(name="Estatus", nullable = false)
    private String Estatus;
    @Column(name="precioinversion", nullable = false)
    private String precioinversion;
    @Column(name="totalcorazones", nullable = false)
    private String totalcorazones;
    @Column(name="totalparticipantes", nullable = false)
    private String totalparticipantes;
    @Column(name="idusuario", nullable = false)
    private String idusuario;
    @Column(name="tipofounding", nullable = false)
    private String tipofounding;

    public Proyecto(Long idproyecto, String name, String fechainicio, String fechatermino, String imagen, String descripcion, String estatus, String precioinversion, String totalcorazones, String totalparticipantes, String idusuario, String tipofounding) {
        this.idproyecto = idproyecto;
        this.name = name;
        this.fechainicio = fechainicio;
        this.fechatermino = fechatermino;
        this.imagen = imagen;
        this.descripcion = descripcion;
        this.Estatus = estatus;
        this.precioinversion = precioinversion;
        this.totalcorazones = totalcorazones;
        this.totalparticipantes = totalparticipantes;
        this.idusuario = idusuario;
        this.tipofounding = tipofounding;
    }//constructor

    public Proyecto(){}//aqui esta el constructor vacio por default

    public Long getIdproyecto() {
        return idproyecto;
    }//getidproyecto

    public void setIdproyecto(Long idproyecto) {
        this.idproyecto = idproyecto;
    }//setidproyecto

    public String getName() {
        return name;
    }//getname

    public void setName(String name) {
        this.name = name;
    }//setname

    public String getFechainicio() {
        return fechainicio;
    }//getfechainicio

    public void setFechainicio(String fechainicio) {
        this.fechainicio = fechainicio;
    }//setfechainicio

    public String getFechatermino() {
        return fechatermino;
    }//getfechatermino

    public void setFechatermino(String fechatermino) {
        this.fechatermino = fechatermino;
    }//setfechatermino

    public String getImagen() {
        return imagen;
    }//getimagen

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }//setimagen

    public String getDescripcion() {
        return descripcion;
    }//getdescripcion

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }//setdescripcion

    public String getEstatus() {
        return Estatus;
    }//getestatus

    public void setEstatus(String estatus) {
        Estatus = estatus;
    }//setestatus

    public String getPrecioinversion() {
        return precioinversion;
    }//getprecioinversion

    public void setPrecioinversion(String precioinversion) {
        this.precioinversion = precioinversion;
    }//setprecioinversion

    public String getTotalcorazones() {
        return totalcorazones;
    }//gettotalcorazones

    public void setTotalcorazones(String totalcorazones) {
        this.totalcorazones = totalcorazones;
    }//settotalcorazones

    public String getTotalparticipantes() {
        return totalparticipantes;
    }//gettotalparticipaciones

    public void setTotalparticipantes(String totalparticipantes) {
        this.totalparticipantes = totalparticipantes;
    }//settotalparticipaciones

    public String getIdusuario() {
        return idusuario;
    }//getidusuario

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }//setidusuario

    public String getTipofounding() {
        return tipofounding;
    }//gettipofounding

    public void setTipofounding(String tipofounding) {
        this.tipofounding = tipofounding;
    }//settipofounding

    @Override
    public String toString() {
        return "Proyecto{" +
                "idproyecto=" + idproyecto +
                ", name='" + name + '\'' +
                ", fechainicio='" + fechainicio + '\'' +
                ", fechatermino='" + fechatermino + '\'' +
                ", imagen='" + imagen + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", Estatus='" + Estatus + '\'' +
                ", precioinversion='" + precioinversion + '\'' +
                ", totalcorazones='" + totalcorazones + '\'' +
                ", totalparticipantes='" + totalparticipantes + '\'' +
                ", idusuario='" + idusuario + '\'' +
                ", tipofounding='" + tipofounding + '\'' +
                '}';
    }//tostring
}//POJO

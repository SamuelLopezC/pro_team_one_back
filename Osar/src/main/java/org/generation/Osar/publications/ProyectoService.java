package org.generation.Osar.publications;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProyectoService {
    private final ProyectoRepository Pr;

    @Autowired
    public ProyectoService (ProyectoRepository Pr){
        this.Pr = Pr;
    }//constructor

    public List<Proyecto> getProyectos(){
        return Pr.findAll();
    }//getProyectos

    public Proyecto getProyecto(Long idproyecto){
        return Pr.findById(idproyecto).orElseThrow(
                () -> new IllegalStateException("Project does not exist " + idproyecto)
        );
    }//getProyecto

    public void deleteProyecto(Long idproyecto){
        if(Pr.existsById(idproyecto)){
            Pr.deleteById(idproyecto);
        }else {
            throw new IllegalStateException("Project does not exist " + idproyecto);
        }//ifelse
    }//deleteUser

    public void addProyecto(){
        //Aqui falta poner el codigo de agregar proyecto
    }//addproyecto


}//service

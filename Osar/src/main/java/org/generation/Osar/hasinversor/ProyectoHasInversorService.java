package org.generation.Osar.hasinversor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProyectoHasInversorService {
    private final ProyectoHasInversorRepository PhIr;
    @Autowired
    public ProyectoHasInversorService(ProyectoHasInversorRepository PhIr) {
        this.PhIr = PhIr;
    }//constructor

    public List<ProyectoHasInversor> getProyectosHasInversor(){
        return PhIr.findAll();
    }//getProyectosHasInversor

    public ProyectoHasInversor getProyectoHasInversor(Long idproyectoinversion){
        return PhIr.findById(idproyectoinversion).orElseThrow(
                () -> new IllegalStateException("ProyectoHasInversor does not exist " + idproyectoinversion)
        );
    }//getProyectoHasInversor
}//service

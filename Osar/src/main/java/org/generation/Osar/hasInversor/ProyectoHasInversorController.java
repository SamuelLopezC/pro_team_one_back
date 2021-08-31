package org.generation.Osar.hasInversor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "/api/proyectohasinversor/")
public class ProyectoHasInversorController {
    private final ProyectoHasInversorService PhIs;
    @Autowired
    public ProyectoHasInversorController(ProyectoHasInversorService PhIs){
        this.PhIs=PhIs;
    }//constructor enlazado a service

    @GetMapping
    public List<ProyectoHasInversor> getProyectosHasInversor(){
        return PhIs.getProyectosHasInversor();
    }//getProyectosHasInversor

    @GetMapping(path="{idproyectoinversor}")
    public ProyectoHasInversor getUser(@PathVariable("idproyectoinversor") Long idproyectoinversor){
        return PhIs.getProyectoHasInversor(idproyectoinversor);
    }//getProyectoHasInversor
}//controller

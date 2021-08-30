package org.generation.Osar.publications;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping(path="/api/project/")
public class ProyectoController {
    private final ProyectoService Ps;
    @Autowired
    public ProyectoController (ProyectoService Ps){
        this.Ps = Ps;
    }//Enlace con el servicio gracias a @Autowired

    @GetMapping
    public List<Proyecto> getProyectos(){
        return Ps.getProyectos();
    }//getproyectos

    @GetMapping(path="{idproyecto}")
    public Proyecto getProyecto(@PathVariable("idproyecto") Long idproyecto){
        return Ps.getProyecto(idproyecto);
    }//getproyecto

    @DeleteMapping(path="{idproyecto}")
    public void  deleteProyecto(@PathVariable("idproyecto") Long idproyecto){
        Ps.deleteProyecto(idproyecto);
    }//deleteproyecto




    
}//controller

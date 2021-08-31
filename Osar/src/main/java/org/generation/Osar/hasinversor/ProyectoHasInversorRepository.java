package org.generation.Osar.hasinversor;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProyectoHasInversorRepository extends JpaRepository<ProyectoHasInversor, Long> {
    @Query("SELECT ph FROM ProyectoHasInversor ph WHERE ph.idproyectoinversion=?1")
    Optional<ProyectoHasInversor> findProyectoHasInversorById (Long idproyectoinversion);
}//Repository

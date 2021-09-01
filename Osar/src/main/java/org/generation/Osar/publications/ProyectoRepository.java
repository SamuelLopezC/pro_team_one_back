package org.generation.Osar.publications;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProyectoRepository extends JpaRepository<Proyecto, Long> {
    @Query("SELECT p FROM Proyecto p WHERE p.name=?1")
    Optional<Proyecto> findProyectoByName(String name);
}//interface

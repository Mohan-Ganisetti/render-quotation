package com.nt.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.nt.Model.Medicals;
@Repository
public interface MedicalRepository extends MongoRepository<Medicals, String> {

}

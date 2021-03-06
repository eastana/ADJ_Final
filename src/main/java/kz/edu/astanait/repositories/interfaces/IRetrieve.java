package kz.edu.astanait.repositories.interfaces;

import kz.edu.astanait.exceptions.NotFoundException;

import javax.ws.rs.BadRequestException;
import java.util.List;

public interface IRetrieve <T>{
    T queryOne(String sql) throws NotFoundException;
    List<T> getAll();
    List<T> findSeveral(String sql) throws BadRequestException;
}

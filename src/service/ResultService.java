package service;

import java.util.List;

import po.Pagination;
import po.QueryResult;
import po.Studentresult;
import po.StudentresultCustom;

public interface ResultService {

	List<Studentresult> getList() throws Exception;

	List<StudentresultCustom> getListByLimit(Pagination pagination, QueryResult queryResult) throws Exception;

	void addOne(Studentresult studentresult) throws Exception;

	List<StudentresultCustom> getListByStudentId(Integer id)  throws Exception;

}

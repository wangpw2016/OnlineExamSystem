package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import mapper.StudentresultMapper;
import mapper.StudentresultMapperCustom;
import po.Pagination;
import po.QueryResult;
import po.Studentresult;
import po.StudentresultCustom;
import po.StudentresultExample;
import service.ResultService;
import vo.QueryResultVo;

public class ResultServiceImpl implements ResultService {
	@Autowired
	private StudentresultMapper studentresultMapper;
	
	@Autowired
	private StudentresultMapperCustom studentresultMapperCustom;

	public List<Studentresult> getList() throws Exception {
		StudentresultExample example=new StudentresultExample();
		return studentresultMapper.selectByExample(example);
	}

	public List<StudentresultCustom> getListByLimit(Pagination pagination, QueryResult queryResult) throws Exception {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		QueryResultVo queryResultVo=new QueryResultVo();
		queryResultVo.setPagination(pagination);
		queryResultVo.setQueryResult(queryResult);
		return studentresultMapperCustom.getListByLimit(queryResultVo);
	}

	@Transactional
	public void addOne(Studentresult studentresult) throws Exception {
		studentresultMapper.insertSelective(studentresult);
	}

	public List<StudentresultCustom> getListByStudentId(Integer id) throws Exception {
		return studentresultMapperCustom.getListByStudentId(id);
	}

}

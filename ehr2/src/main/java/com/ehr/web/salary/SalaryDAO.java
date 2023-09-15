package com.ehr.web.salary;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalaryDAO {

	Map<String, Object> elist(Map<String, Object> map);

	Map<String, Object> slist(Map<String, Object> map);

	Map<String, Object> searchSal(Map<String, Object> map);

	Map<String, Object> searchSal2(Map<String, Object> map);

	List<Map<String, Object>> list(Map<String, Object> map);

	List<Map<String, Object>> sallist(Map<String, Object> map);

	int save(Map<String, Object> map);

	int getCount(int eno);
	
}

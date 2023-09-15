package com.ehr.web.main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {

	Map<String, Object> loginCheck(Map<String, Object> map);

	int eCount(Map<String, Object> map);

	int eCountReset(Map<String, Object> map);

	int IDresult(Map<String, Object> map);

	int PWresult(Map<String, Object> map);

	int eCountPlus(Map<String, Object> map);

	Map<String, Object> login(String eid);

	int ecountPW(Map<String, Object> map);
	
	void join(Map<String, Object> map);

	int eidcheck(String eid);

	int eemailcheck(String eemail);

	List<Map<String, Object>> newMember();

	void mypageupdate(Map<String, Object> map);

	List<Map<String, Object>> nlist();

	Map<String, Object> ndetail(int nno);

	void nwrite(Map<String, Object> map);

	void ndetailDel(Map<String, Object> map);

	void ndetailUp(Map<String, Object> map);

	Map<String, Object> findID(Map<String, Object> map);

	Map<String, Object> findPW(Map<String, Object> map);

	void changePW(Map<String, Object> result);


	

}

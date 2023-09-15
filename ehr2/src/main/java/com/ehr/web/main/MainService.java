package com.ehr.web.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {
@Autowired
private MainDAO mainDAO;

public Map<String, Object> loginCheck(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return mainDAO.loginCheck(map);
}

public int eCount(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return mainDAO.eCount(map);
}

public int eCountReset(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return mainDAO.eCountReset(map);
}

public int IDresult(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return mainDAO.IDresult(map);
}

public int PWresult(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return mainDAO.PWresult(map);
}

public int eCountPlus(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return mainDAO.eCountPlus(map);
}

public Map<String, Object> login(String eid) {
	// TODO Auto-generated method stub
	return mainDAO.login(eid);
}

public int ecountPW(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return mainDAO.ecountPW(map);
}
public void join(Map<String, Object> map) {
	mainDAO.join(map);
}


public int eidcheck(String eid) {
	return mainDAO.eidcheck(eid);
}


public int eemailcheck(String eemail) {
	return mainDAO.eemailcheck(eemail);
}

public List<Map<String, Object>> newMember() {
	// TODO Auto-generated method stub
	return mainDAO.newMember();
}

public void mypageupdate(Map<String, Object> map) {
	 mainDAO.mypageupdate(map);	
}

public List<Map<String, Object>> nlist() {
	List<Map<String, Object>> list = mainDAO.nlist();
	return list;
}

public Map<String, Object> ndetail(int nno) {
	return mainDAO.ndetail(nno);
}

public void nwrite(Map<String, Object> map) {
	mainDAO.nwrite(map);
	
}

public void ndetailDel(Map<String, Object> map) {
	mainDAO.ndetailDel(map);
	
}

public void ndetailUp(Map<String, Object> map) {
	mainDAO.ndetailUp(map);
	
}

public Map<String, Object> findID(Map<String, Object> map) {
	return mainDAO.findID(map);
}

public Map<String, Object> findPW(Map<String, Object> map) {
	return mainDAO.findPW(map);
}

public void changePW(Map<String, Object> result) {
	mainDAO.changePW(result);
	
}


}

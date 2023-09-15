package com.ehr.web.salary;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContractService {
	
	@Autowired
	private ContractDAO contractDAO;

	public List<Map<String, Object>> clist(Map<String, Object> map) {
		return contractDAO.clist(map);
	}

	public Map<String, Object> elist(Map<String, Object> map) {
		return contractDAO.elist(map);
	}

	public Map<String, Object> clist2(Map<String, Object> map) {
		return contractDAO.clist2(map);
	}

	public int aggrCheck(Map<String, Object> map) {
		return contractDAO.aggrCheck(map);
	}

	public Map<String, Object> slist(Map<String, Object> map) {
		return contractDAO.slist(map);
	}

	public List<Map<String, Object>> adclist(Map<String, Object> map) {
		return contractDAO.adclist(map);
	}


}

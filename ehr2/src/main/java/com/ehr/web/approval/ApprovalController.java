package com.ehr.web.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	private ApprovalUtil util;
	
	@GetMapping("/approval")
	public String approval(Model model, HttpSession session) {
		ApprovalDTO dto = new ApprovalDTO();
		Map<String, Object> sessionInfo = util.getSessionInfo(session);
		String egrade = sessionInfo.get("egrade").toString();
		String eno = sessionInfo.get("eno").toString();
		
		dto.setEgrade(egrade); 
		List<ApprovalDTO> approval = approvalService.approval(dto);
		model.addAttribute("approval", approval);
		model.addAttribute("myEno", eno);
		return "/approval";
	}
	
	@PostMapping("/approval")
	public String approvalInsert(@RequestParam Map<String, String> map, HttpSession session) {
		Map<String, Object> sessionInfo = util.getSessionInfo(session);
		String eno = sessionInfo.get("eno").toString(); 
		
		/* jsp 에서 뽑아온 값 dto로 옮기기 */
		ApprovalDTO dto = new ApprovalDTO();
		dto.setEno(eno); 
		dto.setAplist(map.get("ipAplist"));
		dto.setAptitle(map.get("ipAptitle"));
		dto.setApcontent(map.get("ipEditor"));
		dto.setAprealfile(map.get("file"));
		/* DB insert */
		int apno = approvalService.approvalInsert(dto);
		//System.out.println(dto.getApno()); //방금삽입된 apno 불러오기
		/* 결재자 insert */
		String[] enoArr = map.get("appersonArr").split(",");
		for (int i = 0; i < enoArr.length; i++) {
			map.put("apperson", enoArr[i]);
			map.put("apno", Integer.toString(dto.getApno()));
			int result = approvalService.apperson(map);
		}
		return "redirect:/approvalBoard";
	}
	
	@GetMapping(value = {"/approvalBoard", "/approvalboard"})
	public String approvalBoard(Model model, ApprovalDTO dto, HttpSession session) {
		Map<String, Object> sessionInfo = util.getSessionInfo(session);
		String eno = sessionInfo.get("eno").toString(); 
		dto.setEno(eno); 
		
		List<ApprovalDTO> approvalBoard = approvalService.approvalBoard(dto);
		List<ApprovalDTO> approvalPerson = approvalService.approvalperson();
        //System.out.println(approvalPerson);
		model.addAttribute("approvalBoard", approvalBoard);
		model.addAttribute("approvalPerson", approvalPerson);
		model.addAttribute("myEno", eno);
		return "/approvalBoard";
	}
	
	
	
	@ResponseBody
	@PostMapping(value = {"/approvaldetail", "/approvalDetail"})
	public String approvalDetail(@RequestParam("apno") int apno) throws JsonProcessingException {
		Map<String, Object> list = new LinkedHashMap<String, Object>();
		list = approvalService.approvalDetail(apno);
		List<LinkedHashMap<String, Object>> list2 = approvalService.appersondetail(apno);//결재자 리스트 불러오기
		//결재자의 순서를 그대로 list2 와 list 합치기
		for (int i = 0; i < list2.size(); i++) {
			LinkedHashMap<String, Object> map = list2.get(i);
			Object valueToRename = map.remove("apperson"); 
			Object valueToRename2 = map.remove("apacptdetail");
			Object valueToRename3 = map.remove("ename"); 
			Object valueToRename4 = map.remove("edept"); 
			Object valueToRename5 = map.remove("egrade"); 
			Object valueToRename6 = map.remove("count"); 
			String newKey = "apperson"+i;
			String newKey2 = "apacptdetail"+i;
			String newKey3 = "ename"+i;
			String newKey4 = "edept"+i;
			String newKey5 = "egrade"+i;
			String newKey6 = "count"+i;
			list2.get(i).put(newKey, valueToRename);
			list2.get(i).put(newKey2, valueToRename2);
			list2.get(i).put(newKey3, valueToRename3);
			list2.get(i).put(newKey4, valueToRename4);
			list2.get(i).put(newKey5, valueToRename5);
			list2.get(i).put(newKey6, valueToRename6);
		}
		//System.out.println(list2);
		for (int i = 0; i < list2.size(); i++) {
			list.putAll(list2.get(i));
		}
		list.put("appersonsize", list2.size());
		//json String 타입으로 바꾸어 jsp에 주입
		ObjectMapper map = new ObjectMapper();
		String json = map.writeValueAsString(list);
		//System.out.println(json);
		return json;
	}
	@ResponseBody
	@GetMapping("/revise")
	public String revise(@RequestParam("apno") int apno, HttpSession session) throws JsonProcessingException {
		Map<String, Object> revise = new LinkedHashMap<String, Object>();
		revise = approvalService.approvalDetail(apno);
		
		ApprovalDTO dto = new ApprovalDTO();
		Map<String, Object> sessionInfo = util.getSessionInfo(session);
		String egrade = sessionInfo.get("egrade").toString();
		String eno = sessionInfo.get("eno").toString();
		
		//System.out.println("나와라...eno"+eno);
		//System.out.println("나와라...egrade"+egrade);
		dto.setEgrade(egrade);
		List<ApprovalDTO> approval = approvalService.approval(dto);
		//System.out.println("approval : "+approval);
		
		// 두 데이터를 합치는 작업
	    Map<String, Object> combinedData = new LinkedHashMap<>();
	    combinedData.put("revise", revise);
	    combinedData.put("approval", approval);
	    combinedData.put("myEno", eno);
	    //System.out.println("combinedData : "+ combinedData);
		
		ObjectMapper map = new ObjectMapper();
		String json = map.writeValueAsString(combinedData);
		//System.out.println(json);
		return json;
	}
	
	@PostMapping("/revise")
	public String revise(@RequestParam Map<String, String> reviseData, HttpSession session) {
		ApprovalDTO dto = new ApprovalDTO();
		dto.setApno(Integer.parseInt(reviseData.get("revApno")));
		dto.setApcontent(reviseData.get("revContent"));
		dto.setApmemo(reviseData.get("revDate"));
		System.out.println(reviseData); 
		//{revApno=18, revContent=<p>테스트....</p>, revAppersonArr=9, revDate=| 수정일 : 2023-9-12}
		int resultRevise = approvalService.revise(dto);
		if (resultRevise == 1) {
			int resultDelete = approvalService.deleteForInsert(dto);
			if (resultDelete != 0) {
				/* 결재자 새로 insert */
				String[] enoArr = reviseData.get("revAppersonArr").split(",");
				for (int i = 0; i < enoArr.length; i++) {
					reviseData.put("apperson", enoArr[i]);
					reviseData.put("apno", Integer.toString(dto.getApno()));
					int resultInsert = approvalService.InsertForRevise(reviseData);
				}
			}
		}
		return "redirect:/approvalBoard";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("delApno") int apno) {
		//System.out.println(apno);
		int deleteAppersonT = approvalService.deleteAppersonT(apno);
		int deleteApprovalT = approvalService.deleteApprovalT(apno);
		return "redirect:/approvalBoard";
	}
	
	@GetMapping(value = {"/doApproval", "/doapproval"})
	public String doApproval(Model model, HttpSession session) {
		ApprovalDTO dto = new ApprovalDTO();
		Map<String, Object> sessionInfo = util.getSessionInfo(session);
		String egrade = sessionInfo.get("egrade").toString();
		String eno = sessionInfo.get("eno").toString();
		String ename = sessionInfo.get("ename").toString();
		dto.setEno(eno);
		List<Map<String, Integer>> apno = approvalService.ApnoForDoAp(dto);
		List<ApprovalDTO> ListForDoAp = approvalService.ListForDoAp(apno);
		//System.out.println(ListForDoAp); [ApprovalDTO(apno=1, myeno=null, myegrade=null, atregdate=null, atregrestdate=null, atregcontent=null, eno=null, edept=null, egrade=null, atregno=null, ename=null, aplist=0, aptitle=test, apcontent=<p>test</p>, apdate=2023-09-06, aporifile=null, aprealfile=, apmemo=null, apperson=null, apacptdetail=null, count=null), ApprovalDTO(apno=20, myeno=null, myegrade=null, atregdate=null, atregrestdate=null, atregcontent=null, eno=null, edept=null, egrade=null, atregno=null, ename=null, aplist=4, aptitle=휴직 요청의 건, apcontent=<p>개인사정으로 인하여 휴직 요청을 드리니 검토 부탁드립니다.                               </p>, apdate=2023-09-08, aporifile=null, aprealfile=, apmemo=null, apperson=null, apacptdetail=null, count=null), ApprovalDTO(apno=24, myeno=null, myegrade=null, atregdate=null, atregrestdate=null, atregcontent=null, eno=null, edept=null, egrade=null, atregno=null, ename=null, aplist=0, aptitle=테스트, apcontent=<p>결재 하기 보드를 위한 테스트</p>, apdate=2023-09-13, aporifile=null, aprealfile=, apmemo=null, apperson=null, apacptdetail=null, count=null)]
		List<ApprovalDTO> ApListForDoAp = approvalService.ApListForDoAp(apno);
		
		Map<String, Object> myInfo = new HashMap<String, Object>();
		myInfo.put("myEno", eno);
		myInfo.put("myEname", ename);
		myInfo.put("myEgrade", egrade);
		
		
		model.addAttribute("ListForDoAp", ListForDoAp); 
		model.addAttribute("ApListForDoAp", ApListForDoAp); 
		model.addAttribute("myInfo",myInfo);
		 
		return "/doApproval";
	}
	
	@ResponseBody
	@PostMapping("/doApDetail")
	public String doApDetail(@RequestParam("apno") int apno) throws JsonProcessingException {
		Map<String, Object> list = new LinkedHashMap<String, Object>();
		list = approvalService.approvalDetail(apno);
		List<LinkedHashMap<String, Object>> list2 = approvalService.appersondetail(apno);//결재자 리스트 불러오기
		//결재자의 순서를 그대로 list2 와 list 합치기
		for (int i = 0; i < list2.size(); i++) {
			LinkedHashMap<String, Object> map = list2.get(i);
			Object valueToRename = map.remove("apperson"); 
			Object valueToRename2 = map.remove("apacptdetail");
			Object valueToRename3 = map.remove("ename"); 
			Object valueToRename4 = map.remove("edept"); 
			Object valueToRename5 = map.remove("egrade"); 
			map.remove("count"); 
			String newKey = "apperson"+i;
			String newKey2 = "apacptdetail"+i;
			String newKey3 = "ename"+i;
			String newKey4 = "edept"+i;
			String newKey5 = "egrade"+i;
			String newKey6 = "count"+i;
			list2.get(i).put(newKey, valueToRename);
			list2.get(i).put(newKey2, valueToRename2);
			list2.get(i).put(newKey3, valueToRename3);
			list2.get(i).put(newKey4, valueToRename4);
			list2.get(i).put(newKey5, valueToRename5);
			list2.get(i).put(newKey6, i);
		}
		//System.out.println(list2);
		for (int i = 0; i < list2.size(); i++) {
			list.putAll(list2.get(i));
		}
		list.put("appersonsize", list2.size());
		//json String 타입으로 바꾸어 jsp에 주입
		ObjectMapper map = new ObjectMapper();
		String json = map.writeValueAsString(list);
		//System.out.println(json);
		return json;
	}
	
	@PostMapping("/doApproval")
	public String doApproval(@RequestParam("doApno") String apno, HttpSession session) {
		Map<String, Object> sessionInfo = util.getSessionInfo(session);
		String eno = sessionInfo.get("eno").toString();
		
		Map<String, String> infoForAp = new HashMap<String, String>();
		infoForAp.put("eno", eno);
		infoForAp.put("apno", apno);
		int doApResult = approvalService.doApproval(infoForAp);
		return "redirect:/doApproval";
	}
	
	@PostMapping("/notAp")
	public String notAp(@RequestParam("doNotApno") String apno, @RequestParam("addMemo") String apmemo, HttpSession session) {
		//System.out.println(apno);
		Map<String, Object> sessionInfo = util.getSessionInfo(session);
		String eno = sessionInfo.get("eno").toString();
		Map<String, String> infoForAp = new HashMap<String, String>();
		infoForAp.put("eno", eno);
		infoForAp.put("apno", apno);
		infoForAp.put("apmemo", apmemo);
		infoForAp.put("aApno", apno);
		int notApResult = approvalService.notAp(infoForAp);
		return "redirect:/doApproval";
	}
	

}

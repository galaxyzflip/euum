package com.mycom.euum.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper memberMapper;

	@Override
	public MemberBean loginService(MemberBean bean) {
		
		return memberMapper.checkLogin(bean);
	}
	
	
	public Map<String, Object> findId(MemberBean bean) {
		MemberBean result = memberMapper.findAccount(bean);
		Map<String, Object> resultMap = new HashMap<>();
		
		if(result == null) {
			resultMap.put("status", -1);
		}else {
			resultMap.put("status", 0);
			resultMap.put("result", result);
		}
		
		return resultMap;
	}


	@Override
	public int resetPassword(MemberBean bean, String memberPassword_check) {

		if(bean.getMemberPassword().equals(memberPassword_check)) {
			return memberMapper.updatePassword(bean);
			
		}else {
			return -1;
		}
		
	}

}

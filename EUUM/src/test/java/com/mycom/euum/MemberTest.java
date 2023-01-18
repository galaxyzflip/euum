package com.mycom.euum;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration(locations = { "file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml",
		"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml",
		"file:src\\main\\webapp\\WEB-INF\\config\\action-servlet.xml",
		"file:src\\main\\resources\\config\\context-*.xml" })

public class MemberTest {

	@Setter(onMethod_ = @Autowired)
	public MemberService memberService;

	/*
	 * @Setter(onMethod_ = @Autowired) public MemberMapper memberMapper;
	 */

	/*
	 * @Test public void test() { log.info("하하하하하"); log.info("하하하하하");
	 * log.info("하하하하하"); log.info("하하하하하"); }
	 */

	@Test
	public void login() {

		MemberBean bean = new MemberBean();
		bean.setMemberEmail("sonsun33@naver.com");
		bean.setMemberPassword("1");
		MemberBean loginUser = memberService.loginService(bean);

		log.info("테스트 : " + loginUser.toString());
		log.info("테스트 : " + loginUser.toString());
		log.info("테스트 : " + loginUser.toString());
		log.info("테스트 : " + loginUser.toString());

	}

}

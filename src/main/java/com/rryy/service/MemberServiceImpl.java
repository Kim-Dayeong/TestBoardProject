package com.rryy.service;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.rryy.domain.MemberVO;
import com.rryy.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	
	
	//회원가입 
	@Override
	public void register(MemberVO vo) throws Exception{
		dao.register(vo);
		
	}
	
	//로그인 
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	//회원 정보 수정 
	@Override
	public void modify(MemberVO vo)throws Exception{
		dao.modify(vo);
	}
	
	// 회원 탈퇴 
	@Override
	public void withdrawal(MemberVO vo) throws Exception{
		dao.withdrawal(vo);
	}
	

	//아이디 중복 확인
	@Override
	public MemberVO idCheck(String userId)throws Exception{
		return dao.idcheck(userId);
	}
	

}

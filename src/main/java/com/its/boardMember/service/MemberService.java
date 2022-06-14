package com.its.boardMember.service;

import com.its.boardMember.dto.MemberDTO;
import com.its.boardMember.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;
    public boolean save(MemberDTO memberDTO) { //회원가입
        int saveResult = memberRepository.save(memberDTO);
        if (saveResult > 0){
            return true;
        }else {
            return false;
        }
    }

    public String duplicateCheck(String memberId) { //아이디 중복체크
        String checkResult = memberRepository.duplicateCheck(memberId);
        if (checkResult == null){
            return "ok";
        }else {
            return "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) { //로그인
        MemberDTO loginMember = memberRepository.login(memberDTO);
        return loginMember;
    }

    public List<MemberDTO> findAll() { //관리자용 회원정보
        return memberRepository.findAll();
    }

    public MemberDTO findById(Long id) { // ajax로 처리된 상세조회
        return memberRepository.findById(id);
    }

    public boolean delete(Long id) { // 관리자용 회원삭제 처리
        int deleteResult = memberRepository.delete(id);
        if (deleteResult > 0){
            return true;
        }else {
            return false;
        }
    }

    public boolean update(MemberDTO memberDTO) { //개인정보 수정
        int updateResult = memberRepository.update(memberDTO);
        if (updateResult > 0){
            return true;
        }else {
            return false;
        }
    }
}

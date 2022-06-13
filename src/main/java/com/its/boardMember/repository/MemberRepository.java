package com.its.boardMember.repository;

import com.its.boardMember.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.nio.channels.SelectableChannel;
import java.util.List;

@Repository
public class MemberRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) { //회원가입
        return sql.insert("Member.save",memberDTO);
    }

    public String duplicateCheck(String memberId) { //아이디 중복체크
        return sql.selectOne("Member.duplicate",memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) { //로그인
        return sql.selectOne("Member.login",memberDTO);
    }

    public List<MemberDTO> findAll() { //관리자용 회원정보
        return sql.selectList("Member.findAll");
    }

    public MemberDTO findById(Long id) { // ajax로 처리된 상세조회
        return sql.selectOne("Member.findById",id);
    }
}

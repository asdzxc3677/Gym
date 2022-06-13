package com.its.boardMember.repository;

import com.its.boardMember.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.nio.channels.SelectableChannel;

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
}

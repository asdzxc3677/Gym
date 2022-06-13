package com.its.boardMember.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // - @Getter, @Setter, @ToString.. 같은 기존에 getter, setter를 자바 코드에 쓰지 않아도 알아서 스프링이 인식하도록 해주는 어노테이션
@NoArgsConstructor // 기본 생성자를 자바 코드에 쓰지 않아도 알아서 스프링이 인식하도록 해주는 어노테이션
@AllArgsConstructor // 필드 생성자를 자바 코드에 쓰지 않아도 알아서 스프링이 인식하도록 해주는 어노테이션
public class MemberDTO {
    private Long id; //회원번호
    private String memberId; //회원아이디
    private String memberPassword; //회원비번
    private String memberName; //회원이름
    private int memberAge; //회원나이
    private String memberPhone; //회원폰번호
}

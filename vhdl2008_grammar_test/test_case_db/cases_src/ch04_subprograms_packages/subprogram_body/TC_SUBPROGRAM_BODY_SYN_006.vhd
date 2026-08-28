-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_body ::= subprogram_specification is subprogram_declarative_part begin subprogram_statement_part end [ subprogram_kind ] [ designator ] ;
-- Case Type: Positive
-- Test Focus: impure function body with constant/subtype declared in subprogram_declarative_part + body with if-elsif-else multi-path return, verification of complex control flow statement combination in function body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sb_grade_ent is port(score:in integer range 0 to 100; grade:out integer); end entity;
architecture bh of sb_grade_ent is
  impure function f_grade(s:integer) return integer is
    constant C_A:integer:=90;
    constant C_B:integer:=75;
    constant C_C:integer:=60;
  begin
    if s>=C_A then return 4;
    elsif s>=C_B then return 3;
    elsif s>=C_C then return 2;
    else return 1;
    end if;
  end function f_grade;
begin
  grade<=f_grade(score);
end architecture bh;

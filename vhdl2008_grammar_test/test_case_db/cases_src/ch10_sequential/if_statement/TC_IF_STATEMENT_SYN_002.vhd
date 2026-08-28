-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: complete if-elsif-else chain with label: contains if_label "l_pri", 4 branches (1 if + 2 elsif + 1 else), condition contains relational operators (>=/<=) and logical operator (and), then body contains multiple statements (signal assignment+report), end if contains matching label, verifies all branches+label+complex condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_full_ent is port(val:in integer; y:out integer); end entity;
architecture bh of if_full_ent is
  signal s_grade:integer:=0;
begin
  process(val) begin
    l_pri:if val>=90 then s_grade<=4; report "A" severity note;
    elsif val>=80 and val<90 then s_grade<=3;
    elsif val>=60 and val<80 then s_grade<=2;
    else s_grade<=1;
    end if l_pri;
    y<=s_grade;
  end process;
end architecture bh;

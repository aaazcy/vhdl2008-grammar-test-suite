-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>= | matching relational operators
-- Case Type: Positive
-- Test Focus: all 12 relational operators + matching (?=): all standard comparisons (= /= < <= > >=) used + the VHDL 2008 matching operators (?= ?/= ?< ?<= ?> ?>=), verifying the various forms of relational_operator in conditions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of rel_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    if a=b then s_res<=1;
    elsif a/=b and a<b then s_res<=2;
    elsif a<=b or a>b then s_res<=3;
    elsif a>=b then s_res<=4;
    else s_res<=0; end if;
  end process;
  y<=s_res;
end architecture bh;

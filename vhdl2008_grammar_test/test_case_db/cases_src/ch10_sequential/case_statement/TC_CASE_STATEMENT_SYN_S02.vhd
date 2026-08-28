-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case [ ? ] expression is case_statement_alternative { case_statement_alternative } end case [ ? ] [ case_label ] ;
-- Case Type: Positive
-- Test Focus: case on enumeration type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_spc2_ent is port(r:out integer); end entity;
architecture bh of case_spc2_ent is
  type t_op is (NOP,LOAD,STORE,ADD,SUB,HALT);
  signal op:t_op:=NOP;
begin
  process variable v:integer:=0; begin
    case op is
      when NOP=>v:=0; when LOAD|STORE=>v:=1;
      when ADD|SUB=>v:=2; when HALT=>v:=99;
    end case;
    r<=v; op<=ADD; wait;
  end process;
end architecture bh;

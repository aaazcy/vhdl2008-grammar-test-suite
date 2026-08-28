-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case [ ? ] expression is case_statement_alternative { case_statement_alternative } end case [ ? ] [ case_label ] ;
-- Case Type: Positive
-- Test Focus: case with explicit label
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_spc3_ent is port(sel:in integer range 0 to 1; r:out integer); end entity;
architecture bh of case_spc3_ent is begin
  process(sel) variable v:integer:=0; begin
    L_sel:case sel is when 0=>v:=0; when 1=>v:=1; end case L_sel;
    r<=v;
  end process;
end architecture bh;

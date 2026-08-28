-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: label mismatch between opening and closing labels of case statement: the case starts with label "L_decode" but the end case references "L_other", verifying that VHDL requires the optional end label to match the opening label exactly when both are present
-- Expected Result: Triggers syntax error: end case label does not match case label
-- Dependencies: None
-- =============================================================
entity case_label_mm_ent is
  port(sel:in integer range 0 to 3; y:out integer);
end entity;
architecture bh of case_label_mm_ent is
  signal s_result:integer:=0;
begin
  process(sel) is
  begin
    L_decode: case sel is
      when 0 => s_result<= 0; y<= 0;
      when 1 => s_result<=10; y<=10;
      when 2 => s_result<=20; y<=20;
      when 3 => s_result<=30; y<=30;
    end case L_other;
  end process;
end architecture bh;

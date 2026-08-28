-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Positive
-- Test Focus: Minimal case: no label, integer expression (0..3), 4 when alternatives each assigning a constant, with when others as fallback, verifying the minimal case structure - no label + full discrete value coverage + OTHERS as a safety net
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_min_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of case_min_ent is
begin
  process(sel) is
  begin
    case sel is
      when 0 => y<=10;
      when 1 => y<=20;
      when 2 => y<=30;
      when 3 => y<=40;
    end case;
  end process;
end architecture bh;

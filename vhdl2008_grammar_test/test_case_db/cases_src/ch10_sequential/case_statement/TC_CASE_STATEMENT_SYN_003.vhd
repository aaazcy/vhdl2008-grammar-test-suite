-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Positive
-- Test Focus: Choices variants: single value (0/1) / discrete_range (2 to 4) / OR-chain (5 or 6 or 7) / OTHERS, expression is integer range 0..7, verifying choices of case_statement_alternative can mix all 4 choice syntax forms
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_choices_ent is
  port(sel:in integer range 0 to 7; y:out integer);
end entity;
architecture bh of case_choices_ent is
begin
  process(sel) is
  begin
    case sel is
      when 0           => y<= 0;
      when 1           => y<= 10;
      when 2 to 4      => y<= 20;
      when 5|6|7       => y<= 30;
    end case;
  end process;
end architecture bh;

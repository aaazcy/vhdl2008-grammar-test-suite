-- =============================================================
-- Case ID: TC_CONDITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SNN: incomplete expression — in if a > the right operand of the comparison operator is missing, so the condition expression is incomplete
-- Expected Result: Triggers syntax error: incomplete expression — missing right operand of comparison
-- Dependencies: None
-- =============================================================

entity ent_cond_snn_003 is
  port (a : in integer);
end entity ent_cond_snn_003;

architecture incomplete of ent_cond_snn_003 is
begin
  process(a)
  begin
    -- ERROR: Incomplete expression — missing right operand after '>'
    if a > then
      null;
    end if;
  end process;
end architecture incomplete;

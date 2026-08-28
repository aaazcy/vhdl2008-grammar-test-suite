-- =============================================================
-- Case ID: TC_CONDITION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SNN: a non-boolean type as an if condition — if 42 then; the condition must evaluate to boolean, and integer cannot be used directly as a condition
-- Expected Result: Triggers type error: condition must be of boolean type
-- Dependencies: None
-- =============================================================

entity ent_cond_snn_001 is
  port (v : in integer);
end entity ent_cond_snn_001;

architecture non_bool of ent_cond_snn_001 is
begin
  process(v)
  begin
    -- ERROR: Condition must be boolean — integer expression not allowed
    if v then
      null;
    end if;
  end process;
end architecture non_bool;

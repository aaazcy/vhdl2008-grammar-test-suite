-- =============================================================
-- Case ID: TC_CONDITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SNN: empty condition expression — an expression is missing between if and then; the condition position cannot be empty
-- Expected Result: Triggers syntax error: missing expression in condition
-- Dependencies: None
-- =============================================================

entity ent_cond_snn_002 is
  port (x : in boolean);
end entity ent_cond_snn_002;

architecture void_expr of ent_cond_snn_002 is
begin
  process(x)
  begin
    -- ERROR: Missing condition expression after 'if'
    if then
      null;
    end if;
  end process;
end architecture void_expr;

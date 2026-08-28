-- =============================================================
-- Case ID: TC_CONDITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SNN: the reserved word then appears directly after if with the condition expression missing — in if then the expression in the condition position is completely absent, not conforming to the syntax requirement of condition ::= expression
-- Expected Result: Triggers syntax error: unexpected token 'then' in a primary
-- Dependencies: None
-- =============================================================

entity cond_missing_expr is
  port (a : in boolean; y : out integer);
end entity cond_missing_expr;

architecture vhdl2008 of cond_missing_expr is
begin
  process(a)
  begin
    if then
      y <= 1;
    end if;
  end process;
end architecture vhdl2008;

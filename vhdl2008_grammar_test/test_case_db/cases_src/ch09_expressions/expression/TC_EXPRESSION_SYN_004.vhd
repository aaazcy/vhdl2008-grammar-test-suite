-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: logical_expression with an or chain: multiple relations joined with or, placed in the condition of an if statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_or_chain_ent is
  port(alert, warn, fail : in bit; trigger : out bit);
end entity;
architecture rtl of expr_or_chain_ent is
begin
  process(alert, warn, fail)
  begin
    if (alert = '1') or (warn = '1') or (fail = '1') then
      trigger <= '1';
    else
      trigger <= '0';
    end if;
  end process;
end architecture rtl;

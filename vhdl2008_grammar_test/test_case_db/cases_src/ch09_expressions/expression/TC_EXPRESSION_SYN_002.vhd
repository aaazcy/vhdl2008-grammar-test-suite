-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: condition_operator form: the ?? operator applied to a primary, converting the right signal to boolean for use in an if condition test
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_cond_ent is
  port(valid : in bit; data : in integer; result : out boolean);
end entity;
architecture rtl of expr_cond_ent is
begin
  process(valid)
  begin
    if ?? valid then
      result <= true;
    else
      result <= false;
    end if;
  end process;
end architecture rtl;

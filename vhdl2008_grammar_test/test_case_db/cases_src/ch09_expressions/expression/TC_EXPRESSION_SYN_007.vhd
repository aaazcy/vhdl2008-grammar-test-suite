-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: expression in a variable assignment: a nand logical expression assigned to a variable, used for combinational logic in a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_var_ent is
  port(x, y : in bit; enable : in bit; z : out bit);
end entity;
architecture rtl of expr_var_ent is
begin
  process(x, y, enable)
    variable v_temp : bit;
  begin
    v_temp := x nand y;
    z <= v_temp and enable;
  end process;
end architecture rtl;

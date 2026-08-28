-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected_expressions: with aggregate choices (pipe-separated values and range) covering full bit_vector(1 downto 0) type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_expr_syn5_ent is port(flag:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of sel_expr_syn5_ent is
begin
  with flag select y <=
    1 when "00",
    2 when "01",
    3 when "10",
    4 when "11";
end architecture bh;

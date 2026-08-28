-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: Minimal form: a single simple_expression (signal a), no shift_operator, as the smallest form of shift_expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity shf_min_ent is
  port(a : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture rtl of shf_min_ent is
begin
  y <= a;
end architecture rtl;

-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Test Focus: SNN — double shift without parentheses: two consecutive shift operators n sll a srl b have no parenthesized grouping, the BNF allows [ shift_operator simple_expression ] only once
-- Expected Result: Triggers syntax error: consecutive shift operators require parentheses
-- Dependencies: None
-- =============================================================
entity shf_snn5_ent is
  port(a : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture err of shf_snn5_ent is
begin
  y <= a sll 1 srl 2;
end architecture err;

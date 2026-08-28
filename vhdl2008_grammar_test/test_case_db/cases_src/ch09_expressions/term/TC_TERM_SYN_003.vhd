-- =============================================================
-- Case ID: TC_TERM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: factor / factor: two factors joined by /, division arithmetic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_div_ent is
  port(dividend, divisor : in integer; quot : out integer);
end entity;
architecture rtl of term_div_ent is
begin
  quot <= dividend / divisor;
end architecture rtl;

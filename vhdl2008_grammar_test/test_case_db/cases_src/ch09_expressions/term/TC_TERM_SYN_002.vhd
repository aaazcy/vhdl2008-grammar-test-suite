-- =============================================================
-- Case ID: TC_TERM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: factor * factor: two factors joined by *, basic multiplication arithmetic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_mul_ent is
  port(x, y : in integer; prod : out integer);
end entity;
architecture rtl of term_mul_ent is
begin
  prod <= x * y;
end architecture rtl;

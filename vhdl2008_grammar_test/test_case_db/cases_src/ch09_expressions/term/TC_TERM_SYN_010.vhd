-- =============================================================
-- Case ID: TC_TERM_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: term as a factor in a complex arithmetic expression / mixing mod with an abs-prefixed factor: abs(x) mod y
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_abs_mod_ent is
  port(x, y : in integer; r : out integer);
end entity;
architecture rtl of term_abs_mod_ent is
begin
  r <= abs(x) mod y;
end architecture rtl;

-- =============================================================
-- Case ID: TC_TERM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: factor rem factor: rem is used for signed remainder arithmetic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_rem_ent is
  port(x, y : in integer; rem_val : out integer);
end entity;
architecture rtl of term_rem_ent is
begin
  rem_val <= x rem y;
end architecture rtl;

-- =============================================================
-- Case ID: TC_TERM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: factor mod factor: mod is used for unsigned remainder arithmetic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_mod_ent is
  port(a, b : in integer; rem_val : out integer);
end entity;
architecture rtl of term_mod_ent is
begin
  rem_val <= a mod b;
end architecture rtl;

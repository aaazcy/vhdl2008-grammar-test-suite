-- =============================================================
-- Case ID: TC_TERM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: minimal form: a single factor (signal a) with no multiplying_operator, as the minimal shape of a term
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_min_ent is
  port(a : in integer; y : out integer);
end entity;
architecture rtl of term_min_ent is
begin
  y <= a;
end architecture rtl;

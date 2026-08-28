-- =============================================================
-- Case ID: TC_TERM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Test Focus: SNN: missing factor after multiplying_operator——in the expression t1 mod ;, there is no factor to the right of mod, so the factor is missing from the { multiplying_operator factor } structure of the term
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity term_missing_factor is
  port(t1 : in time; y : out time);
end entity;
architecture vhdl2008 of term_missing_factor is
begin
  y <= t1 mod ;
end architecture vhdl2008;

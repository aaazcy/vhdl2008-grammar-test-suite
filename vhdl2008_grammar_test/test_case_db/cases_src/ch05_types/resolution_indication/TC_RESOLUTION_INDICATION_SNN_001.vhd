-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SNN_001
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Bare parentheses without a function name inside. The
--   parenthesized form requires an element_resolution inside the
--   parentheses; empty parentheses are invalid.
-- Expected Result: VHDL syntax error: expected element_resolution inside ()
-- Dependencies: None
-- =============================================================
entity resolution_indication_empty_parens is
end entity resolution_indication_empty_parens;

architecture empty_parens of resolution_indication_empty_parens is
  -- ERROR: empty parentheses, no element_resolution
  subtype t_bad is () integer;
  signal s : t_bad;
begin
end architecture empty_parens;

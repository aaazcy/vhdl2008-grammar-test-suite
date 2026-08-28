-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SNN_002
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Uses a keyword "range" where a resolution_function_name
--   is expected. The BNF allows only a function name or parenthesized
--   form. "range" is a keyword, not a function name.
-- Expected Result: VHDL syntax error at "range"
-- Dependencies: None
-- =============================================================
entity resolution_indication_keyword_as_func is
end entity resolution_indication_keyword_as_func;

architecture keyword as_func of resolution_indication_keyword_as_func is
  -- ERROR: "range" is a reserved word, not a resolution function name
  subtype t_bad is range integer;
  signal s : t_bad;
begin
end architecture keyword as_func;

-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SNN_003
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Unclosed parenthesis in the parenthesized form. The
--   BNF requires matching '(' and ')'. A missing closing paren
--   is a syntax error.
-- Expected Result: VHDL syntax error: expected ')'
-- Dependencies: None
-- =============================================================
entity resolution_indication_unclosed_paren is
end entity resolution_indication_unclosed_paren;

architecture unclosed of resolution_indication_unclosed_paren is
  function r(drivers : bit_vector) return bit is
  begin return '0'; end function;
  -- ERROR: missing closing parenthesis
  subtype t_bad is (r bit;
  signal s : t_bad;
begin
end architecture unclosed;

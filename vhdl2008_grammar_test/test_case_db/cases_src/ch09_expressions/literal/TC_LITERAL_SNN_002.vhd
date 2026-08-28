-- =============================================================
-- Case ID: TC_LITERAL_SNN_002
-- Rule Type: Syntax
-- BNF Production: literal
-- IEEE Section: 9.3.3.1
-- BNF Text: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Test Focus: invalid literal form - malformed bit_string_literal with wrong format specifier
-- Case Type: Negative
-- Expected Result: Triggers syntax error (invalid bit string literal syntax)
-- Dependencies: None
-- =============================================================
entity tc_literal_snn_002 is
  port (
    vec    : out bit_vector(7 downto 0)
  );
end entity tc_literal_snn_002;

architecture error of tc_literal_snn_002 is
begin
  vec <= H"GG";  -- ERROR: 'G' is not a valid hex digit in bit_string_literal
end architecture error;

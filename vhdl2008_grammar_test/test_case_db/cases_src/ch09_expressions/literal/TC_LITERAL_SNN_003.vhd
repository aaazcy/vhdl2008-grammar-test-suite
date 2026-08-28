-- =============================================================
-- Case ID: TC_LITERAL_SNN_003
-- Rule Type: Syntax
-- BNF Production: literal
-- IEEE Section: 9.3.3.1
-- BNF Text: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Test Focus: type mismatch with literal - string literal assigned to bit_vector signal
-- Case Type: Negative
-- Expected Result: Triggers semantic error (string cannot be assigned to bit_vector)
-- Dependencies: None
-- =============================================================
entity tc_literal_snn_003 is
  port (
    vec    : out bit_vector(7 downto 0)
  );
end entity tc_literal_snn_003;

architecture error of tc_literal_snn_003 is
begin
  vec <= "ABCDEFGH";  -- ERROR: string literal contains non-bit characters, not valid for bit_vector
end architecture error;

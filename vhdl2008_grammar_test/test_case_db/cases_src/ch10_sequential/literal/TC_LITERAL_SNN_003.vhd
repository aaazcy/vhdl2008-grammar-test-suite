-- =============================================================
-- Case ID: TC_LITERAL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Negative
-- Test Focus: SNN: an illegal hexadecimal digit in bit_string_literal — the G in X"1G" is not a legal hexadecimal digit, the extended digits of bit_string_literal must match the base
-- Expected Result: Triggers analysis error: type bit does not define character 'G'
-- Dependencies: None
-- =============================================================
entity literal_bad_hex is port(y:out bit_vector(7 downto 0)); end entity;
architecture vhdl2008 of literal_bad_hex is
  signal s:bit_vector(7 downto 0):=X"1G";
begin
  y<=s;
end architecture vhdl2008;

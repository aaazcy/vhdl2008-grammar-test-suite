-- =============================================================
-- Case ID: TC_LITERAL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: literal: bit_string_literal (binary) and hex bit string literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity literal_syn3_ent is port(y_bv:out bit_vector(7 downto 0); y_hex:out bit_vector(7 downto 0)); end entity;
architecture bh of literal_syn3_ent is
begin
  y_bv<=B"1010_0101";
  y_hex<=X"A5";
end architecture bh;

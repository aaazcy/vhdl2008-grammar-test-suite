-- =============================================================
-- Case ID: TC_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: bit_string_literal as a literal: bit_string_literal in the three bases B"11001100", X"CC", O"314" used in register reset value assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lit_bit_string_literal is
  port (
    fmt_sel  : in  integer range 0 to 2;
    data_out : out bit_vector(7 downto 0)
  );
end entity lit_bit_string_literal;

architecture reg_reset of lit_bit_string_literal is
  constant C_BIN : bit_vector(7 downto 0) := B"11001100";  -- bit_string_literal: binary
  constant C_HEX : bit_vector(7 downto 0) := X"CC";        -- bit_string_literal: hex
  constant C_OCT : bit_vector(8 downto 0) := O"314";       -- bit_string_literal: octal
begin
  with fmt_sel select
    data_out <= C_BIN when 0,
                C_HEX when 1,
                C_OCT(7 downto 0) when 2;
end architecture reg_reset;

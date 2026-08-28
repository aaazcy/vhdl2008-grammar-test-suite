-- =============================================================
-- Case ID: TC_STRING_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Positive
-- Test Focus: String literal multiple use scenarios: string constant assignment (with spaces)/bit_vector assignment/attribute values/report messages, verify the use of printable character sequences of string_literal in different contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity str_ent is port(y:out integer); end entity;
architecture bh of str_ent is
  constant C_MSG:string:="Hello VHDL 2008";
  signal s_bits:bit_vector(7 downto 0):="10101010";
  attribute my_note:string;
  attribute my_note of bh:architecture is "string literal test";
begin
  process is begin
    report C_MSG severity note;
    y<=1 when s_bits="10101010" else 0;
    wait;
  end process;
end architecture bh;

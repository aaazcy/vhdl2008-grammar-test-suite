-- =============================================================
-- Case ID: TC_LITERAL_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: enumeration_literal as a literal: character type enumeration literals 'A', '0', 'Z' used in the case statement of a 7-seg display decoder
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lit_enum_literal is
  port (
    char_in  : in  character;
    seg_out  : out bit_vector(6 downto 0)
  );
end entity lit_enum_literal;

architecture seven_seg of lit_enum_literal is
begin
  with char_in select
    seg_out <= "1111110" when '0',    -- enumeration_literal: character '0'
               "0110000" when '1',    -- enumeration_literal: character '1'
               "1101101" when '2',
               "1111001" when '3',
               "1110111" when 'A',
               "0011111" when 'b',
               "0000000" when others;
end architecture seven_seg;

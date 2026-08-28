-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Positive
-- Test Focus: element_constraint with array_constraint: array of
--            bit_vector elements where each element has its own
--            index_constraint. A pattern generator LUT.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pattern_generator_lut is
  port (
    sel    : in  integer range 0 to 7;
    pat    : out bit_vector(7 downto 0)
  );
end entity pattern_generator_lut;

architecture rtl of pattern_generator_lut is
  -- element_constraint: each element is a constrained bit_vector
  subtype pattern_byte is bit_vector(7 downto 0);
  type pattern_lut is array (0 to 7) of pattern_byte;
  constant patterns : pattern_lut := (
    0 => "10101010", 1 => "01010101", 2 => "11001100",
    3 => "00110011", 4 => "11110000", 5 => "00001111",
    6 => "11111111", 7 => "00000000"
  );
begin
  pat <= patterns(sel);
end architecture rtl;

-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Positive (Production-Specific)
-- Test Focus: Direct constrained_array_definition test covering
--            all index_constraint variants: ascending, descending,
--            and integer range expression. A 7-segment display
--            decoder uses multiple constrained arrays.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity seven_seg_decoder is
  port (
    digit     : in  integer range 0 to 9;
    segments  : out bit_vector(6 downto 0)
  );
end entity seven_seg_decoder;

architecture rtl of seven_seg_decoder is
  -- constrained_array_definition with ascending range
  type seg_lut is array (0 to 9) of bit_vector(6 downto 0);
  constant seg_table : seg_lut := (
    0 => "1111110", 1 => "0110000", 2 => "1101101",
    3 => "1111001", 4 => "0110011", 5 => "1011011",
    6 => "1011111", 7 => "1110000", 8 => "1111111",
    9 => "1111011"
  );
  -- constrained_array_definition with descending range
  type seg_name is array (6 downto 0) of bit;
  signal seg_out : seg_name;
begin
  seg_out <= seg_name(seg_table(digit));
  segments <= bit_vector(seg_out);
end architecture rtl;

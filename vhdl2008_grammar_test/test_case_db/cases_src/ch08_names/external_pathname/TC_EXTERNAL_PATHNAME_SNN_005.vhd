-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Negative
-- Test Focus: SNN: missing dot after ^ in relative_pathname — in <<signal ^uut.clk : bit>>, '^' is directly followed by an identifier with no '.' separator; relative_pathname requires either each '^ .' pair or '.'+pathname_element directly after
-- Expected Result: Triggers syntax error at missing dot after ^
-- Dependencies: None
-- =============================================================
entity ext_path_miss_updot is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_path_miss_updot is
  -- ERROR: '^' must be followed by '.' before pathname_element
  alias bad_ref is <<signal ^uut.clk : bit>>;
begin
  q <= d;
end architecture vhdl2008;

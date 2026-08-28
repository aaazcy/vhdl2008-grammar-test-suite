-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Negative
-- Test Focus: SNN: missing dot after ^——in ^parent.sig an identifier follows '^' directly with no '.' separator; a relative_pathname requires a '.' immediately after every '^'
-- Expected Result: Triggers syntax error at missing dot after ^
-- Dependencies: None
-- =============================================================
entity rel_path_miss_dot is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of rel_path_miss_dot is
  -- ERROR: '^' must be followed immediately by '.'
  alias bad_ref is <<signal ^uut.sig : bit>>;
begin
  q <= d;
end architecture vhdl2008;

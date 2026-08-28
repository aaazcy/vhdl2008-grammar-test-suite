-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Negative
-- Test Focus: SNN: partial_pathname is missing after the leading '.' in absolute_pathname — in <<signal . : bit>> there is no pathname_element after the '.', so partial_pathname is missing, and the construct does not conform to the syntax requirement that absolute_pathname must consist of '.' plus a non-empty path
-- Expected Result: Triggers syntax error (pathname element expected after dot)
-- Dependencies: None
-- =============================================================
entity abs_path_missing_partial is
end entity;

architecture vhdl2008 of abs_path_missing_partial is
  alias bad_ref is <<signal . : bit>>;
begin
end architecture vhdl2008;

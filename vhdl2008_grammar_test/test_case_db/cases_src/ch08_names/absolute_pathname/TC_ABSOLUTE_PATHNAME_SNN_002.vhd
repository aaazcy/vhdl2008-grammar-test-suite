-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Negative
-- Test Focus: SNN: the pathname_element in the partial_pathname of absolute_pathname is not an identifier — in <<signal .tb_top.2bad : bit>>, '2bad' starts with a digit and cannot form an identifier, so the pathname_element position cannot be parsed
-- Expected Result: Triggers syntax error (pathname element expected)
-- Dependencies: None
-- =============================================================
entity abs_path_bad_element is
end entity;

architecture vhdl2008 of abs_path_bad_element is
  alias bad_ref is <<signal .tb_top.2bad : bit>>;
begin
end architecture vhdl2008;

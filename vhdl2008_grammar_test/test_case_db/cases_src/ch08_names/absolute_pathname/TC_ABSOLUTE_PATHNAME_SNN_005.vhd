-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Negative
-- Test Focus: SNN: whitespace after the dot produces an empty partial_pathname — in absolute_pathname, at least one pathname_element must immediately follow the ".", and if only spaces or whitespace characters follow the dot with no identifier, the partial_pathname is empty, which is illegal
-- Expected Result: Triggers syntax error at empty partial_pathname
-- Dependencies: None
-- =============================================================
entity abs_path_empty_part is
  port(clk : in bit; result : out bit);
end entity;

architecture vhdl2008 of abs_path_empty_part is
  -- ERROR: '.' followed by empty partial_pathname (no identifier after dot)
  alias bad_ref is <<signal .  : bit>>;
begin
  result <= clk;
end architecture vhdl2008;

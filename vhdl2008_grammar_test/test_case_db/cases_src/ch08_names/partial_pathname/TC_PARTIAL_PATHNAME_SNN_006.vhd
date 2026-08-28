-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Negative
-- Test Focus: SNN: pathname_element ends with a dot but has no following element——ent..sig contains an empty pathname_element between the dots; every pair of dots must have a valid identifier between them
-- Expected Result: Triggers syntax error at empty element between dots
-- Dependencies: None
-- =============================================================
entity part_path_empty_mid is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of part_path_empty_mid is
  -- ERROR: Empty element between two consecutive dots
  alias bad_ref is <<signal .tb_top..uut.sig : bit>>;
begin
  q <= d;
end architecture vhdl2008;

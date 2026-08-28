-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Negative
-- Test Focus: SNN: consecutive dots (empty pathname_element)——ent..sig lacks an identifier between the dots; each pathname_element is consumed as the object name after '.' but that object name is missing
-- Expected Result: Triggers syntax error at consecutive dots
-- Dependencies: None
-- =============================================================
entity part_path_double_dot is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of part_path_double_dot is
  -- ERROR: Consecutive dots '.' without an intervening element name
  alias bad_ref is <<signal .tb_top..u_dut.sig : bit>>;
begin
  q <= d;
end architecture vhdl2008;

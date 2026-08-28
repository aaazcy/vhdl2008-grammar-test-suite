-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Negative
-- Test Focus: SNN: partial_pathname missing the object name at the end——ent.arch. ends with a dot without an object_simple_name; a partial_pathname must end with an object_simple_name
-- Expected Result: Triggers syntax error at missing object_simple_name
-- Dependencies: None
-- =============================================================
entity part_path_miss_obj is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of part_path_miss_obj is
  -- ERROR: partial_pathname ends with '.' without object_simple_name
  alias bad_ref is <<signal .tb_top.u_dut. : bit>>;
begin
  q <= d;
end architecture vhdl2008;

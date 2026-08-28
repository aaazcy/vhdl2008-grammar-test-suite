-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Negative
-- Test Focus: SNN: empty partial_pathname——in the absolute pathname there is nothing after the dot; a partial_pathname must contain at least an object_simple_name (i.e. at least one identifier)
-- Expected Result: Triggers syntax error at empty pathname
-- Dependencies: None
-- =============================================================
entity part_path_empty is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of part_path_empty is
  -- ERROR: empty partial_pathname after the leading dot
  alias bad_ref is <<signal . : bit>>;
begin
  q <= d;
end architecture vhdl2008;

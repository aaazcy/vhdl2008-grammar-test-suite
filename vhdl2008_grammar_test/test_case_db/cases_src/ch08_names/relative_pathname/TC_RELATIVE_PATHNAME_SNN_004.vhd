-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Negative
-- Test Focus: SNN: missing path after ^.——in <<signal ^. : bit>> a colon type mark directly follows ^. with no partial_pathname; a relative_pathname must have at least one object_simple_name after the upward references
-- Expected Result: Triggers syntax error at empty path after ^
-- Dependencies: None
-- =============================================================
entity rel_path_empty_after_up is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of rel_path_empty_after_up is
  -- ERROR: '^.' must be followed by partial_pathname (at least object_simple_name)
  alias bad_ref is <<signal ^. : bit>>;
begin
  q <= d;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Negative
-- Test Focus: SNN: missing dot between ^ characters——in ^.^.^uut.sig the third ^ lacks a following dot; every ^ must be paired with the . after it
-- Expected Result: Triggers syntax error at missing dot after ^
-- Dependencies: None
-- =============================================================
entity rel_path_broken_chain is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of rel_path_broken_chain is
  -- ERROR: Third '^' not followed by '.' before pathname element
  alias bad_ref is <<signal ^.^.^uut.sig : bit>>;
begin
  q <= d;
end architecture vhdl2008;

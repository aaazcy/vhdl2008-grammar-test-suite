-- =============================================================
-- Case ID: TC_GENERIC_MAP_ASPECT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: generic_map_aspect ::= generic map ( generic_association_list )
-- Case Type: Negative
-- Test Focus: generic_map_aspect: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generic_map_asp_e2 is end entity;
architecture bh of generic_map_asp_e2 is
  -- ERROR: invalid syntax in generic_map_aspect
  signal s : bit;
begin
  s <= '1'
end architecture bh;
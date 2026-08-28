-- =============================================================
-- Case ID: TC_GENERIC_MAP_ASPECT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: generic_map_aspect ::= generic map ( generic_association_list )
-- Case Type: Negative
-- Test Focus: generic_map_aspect: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generic_map_asp_e3 is end entity;
architecture bh of generic_map_asp_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;
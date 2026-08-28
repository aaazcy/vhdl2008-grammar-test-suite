-- =============================================================
-- Case ID: TC_PORT_MAP_ASPECT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: port_map_aspect ::= port map ( port_association_list )
-- Case Type: Negative
-- Test Focus: port_map_aspect: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity port_map_aspect_e3 is end entity;
architecture bh of port_map_aspect_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;
-- =============================================================
-- Case ID: TC_PORT_MAP_ASPECT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PORT_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Test Focus: Port map aspect: port map (association_list) — actual-to-formal port mapping in instantiation/binding
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_port_map_aspect_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_port_map_aspect_syn_s01 is
begin
  r<=42;end architecture bh;

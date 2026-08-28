-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Test Focus: Entity header: [formal_generic_clause] [formal_port_clause] — generics and ports in entity declaration
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_entity_header_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_entity_header_syn_s01 is
begin
  r<=42;end architecture bh;

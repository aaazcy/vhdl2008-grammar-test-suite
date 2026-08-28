-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header with generic_clause and generic_map_aspect: generic(type t) generic map(t=>integer), verification of generic_map_aspect as optional semicolon clause at tail of package_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package queue_pkg is
  generic(type item_t);
  type t_queue is array(0 to 7) of item_t;
end package;
entity ph_gmap_ent is
  port(r:out integer);
end entity;
architecture bh of ph_gmap_ent is
  package p_q is new work.queue_pkg generic map(item_t=>bit);
begin
  r<=0;
end architecture bh;

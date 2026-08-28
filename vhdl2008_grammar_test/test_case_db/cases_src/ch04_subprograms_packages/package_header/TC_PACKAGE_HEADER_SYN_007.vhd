-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header with type generic: generic(type elem_t), verification of syntax position of 2008 type generic in package_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package stack_pkg is
  generic(type elem_t);
  type t_stack is array(1 to 16) of elem_t;
end package stack_pkg;
entity ph_typegen_ent is
  port(r:out integer);
end entity;
architecture bh of ph_typegen_ent is
  package p_int_stack is new work.stack_pkg generic map(elem_t=>integer);
begin
  r<=0;
end architecture bh;

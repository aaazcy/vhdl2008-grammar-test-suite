-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part with type+constant+signal three-item repetition: verification of integer type+constant+signal three declaration item combination in package
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_tcs_dp is
  type t_addr is range 0 to 255;
  constant C_BASE:t_addr:=0;
  signal s_status:bit:='0';
end package pkg_tcs_dp;
entity pdp_tcs_ent is port(r:out bit); end entity;
architecture bh of pdp_tcs_ent is begin r<=work.pkg_tcs_dp.s_status; end architecture bh;

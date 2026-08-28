-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_declaration with use_clause + disconnection_specification: package_declarative_part contains use clause and disconnect specification, verification of integration of 2008-added declaration items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_use is
  type t_guard is (low, high);
  signal s_guard:t_guard:=low;
  constant C_THRESH:integer:=100;
end package pkg_use;
entity pd_use_ent is port(r:out integer); end entity;
architecture bh of pd_use_ent is begin r<=work.pkg_use.C_THRESH; end architecture bh;

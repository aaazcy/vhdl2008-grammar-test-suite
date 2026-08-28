-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_declaration end with only [package] and [package_simple_name] omitted: end package, verification of the form with only the first optional token and the second omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_endkw is
  type t_nibble is array(3 downto 0) of bit;
  constant C_NIB:t_nibble:="1010";
end package;
entity pd_endkw_ent is port(r:out bit); end entity;
architecture bh of pd_endkw_ent is begin r<=work.pkg_endkw.C_NIB(0); end architecture bh;

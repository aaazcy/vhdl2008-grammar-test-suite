-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_declaration with generic header + type declaration: generic(WIDTH:positive) introduced via package_header, package_declarative_part contains subtype and function declaration, verification of generic package declaration syntax of package_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_fifo is
  generic(WIDTH:positive; DEPTH:positive);
  type t_word is array(0 to WIDTH-1) of bit;
  type t_mem is array(0 to DEPTH-1) of t_word;
  constant C_DEPTH:positive:=DEPTH;
end package pkg_fifo;
package my_pkg_fifo is new work.pkg_fifo generic map(WIDTH => 8, DEPTH => 16);
entity pd_fgen_ent is port(d:out positive); end entity;
architecture bh of pd_fgen_ent is begin d<=work.my_pkg_fifo.C_DEPTH; end architecture bh;

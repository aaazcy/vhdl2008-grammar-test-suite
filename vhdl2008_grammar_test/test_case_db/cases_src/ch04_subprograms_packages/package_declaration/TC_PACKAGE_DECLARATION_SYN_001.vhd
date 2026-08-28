-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Package declaration with type+constant+function declaration+component declaration: integer type/subtype/constant/function declaration(forward)/component declaration/attribute spec declared in package, verification that package_declarative_part can contain all declaration item categories
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_decl is
  type t_data is range 0 to 65535;
  subtype t_byte is t_data range 0 to 255;
  constant C_MAX:t_data:=65535;
  function f_dbl(x:t_data) return t_data;
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  attribute pkg_ver:string;
  attribute pkg_ver of pkg_decl:package is "1.0";
end package pkg_decl;
package body pkg_decl is
  function f_dbl(x:t_data) return t_data is begin return x*2; end function;
end package body pkg_decl;
entity pd_ent is port(a:in bit; y:out bit); end entity;
architecture bh of pd_ent is begin y<=a; end architecture bh;

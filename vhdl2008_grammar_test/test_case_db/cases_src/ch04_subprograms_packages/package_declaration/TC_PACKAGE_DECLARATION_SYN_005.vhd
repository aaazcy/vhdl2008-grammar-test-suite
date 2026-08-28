-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_declaration with protected type declaration + component declaration: protected type + component + attribute_specification declared in package_declarative_part, verification of multiple legal combinations of category B declaration items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_shared is
  type t_counter is protected
    procedure increment;
    impure function value return integer;
  end protected;
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  attribute info:string;
  attribute info of pkg_shared:package is "shared counter demo";
end package pkg_shared;
package body pkg_shared is
  type t_counter is protected body
    variable cnt:integer:=0;
    procedure increment is begin cnt:=cnt+1; end procedure;
    impure function value return integer is begin return cnt; end function;
  end protected body;
end package body pkg_shared;
entity pd_pt_ent is port(clk:in bit; q:out bit); end entity;
architecture bh of pd_pt_ent is
  signal d_int:bit:='0';
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
begin
  d_int<=not d_int when clk'event and clk='1';
  dff_inst: dff port map(clk=>clk, d=>d_int, q=>q);
end architecture bh;

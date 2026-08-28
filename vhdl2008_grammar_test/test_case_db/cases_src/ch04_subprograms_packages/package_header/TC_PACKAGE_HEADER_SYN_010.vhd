-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header with function generic in generic_clause: generic(function f(x:integer) return integer), verification that package_header can contain subprogram generic parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package transform_pkg is
  generic(function f_transform(x:integer) return integer);
  function apply(x:integer) return integer;
end package;
package body transform_pkg is
  function apply(x:integer) return integer is begin return f_transform(x); end function;
end package body;
entity ph_funcgen_ent is port(inp,outp:out integer); end entity;
architecture bh of ph_funcgen_ent is
  function f_double(x:integer) return integer is begin return x*2; end function;
  package p_dbl is new work.transform_pkg generic map(f_transform=>f_double);
begin
  inp<=5; outp<=p_dbl.apply(5);
end architecture bh;

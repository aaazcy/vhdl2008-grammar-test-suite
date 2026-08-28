-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: package instantiation with generic_map_aspect, generic map with positional+named association: package p_fifo is new fifo_pkg generic map(8, DEPTH=>256), verification of two association forms of association_element in generic_map_aspect
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package fifo_pkg is
  generic(width:positive; depth:positive);
  type t_data is array(1 to width) of bit;
  function f_depth return positive;
end package;
package body fifo_pkg is
  function f_depth return positive is begin return depth; end function;
end package body;
package p_fifo is new work.fifo_pkg generic map(width=>8, depth=>256);
entity pi_fifo_ent is port(d:out positive); end entity;
architecture bh of pi_fifo_ent is begin d<=work.p_fifo.f_depth; end architecture bh;

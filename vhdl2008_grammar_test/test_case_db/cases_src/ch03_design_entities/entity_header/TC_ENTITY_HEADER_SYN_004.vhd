-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Positive
-- Test Focus: entity_header all combinations — generic+port+generic map: contains VHDL 2008 generic type interface `generic(type T)` + generic function default `function f_op(...) return T is <>` + ports using the generic type `p_in:in T`, verifying entity_header supports the complete VHDL 2008 generic interface system
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity eh_2008 is
  generic(
    type T;
    function f_op(a,b:T) return T is <>;
    constant C_INIT:T
  );
  port(
    p_in  : in  T;
    p_out : out T
  );
end entity;
architecture bh of eh_2008 is
begin
  p_out <= f_op(p_in, C_INIT);
end architecture bh;

-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_012
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: VHDL 2008 generic subprogram interface: entity contains a generic function as the interface (function signature+default implementation), the architecture can call this function via the generic name, verifying entity_declaration supports interface_function_specification as a generic parameter
-- Expected Result: Compiles successfully (VHDL 2008)
-- Dependencies: None
-- =============================================================
entity ent_gen_func is
  generic(
    function f_op(a, b : integer) return integer is <>
  );
  port(
    x, y : in  integer;
    z    : out integer
  );
end entity ent_gen_func;
architecture bh of ent_gen_func is
begin
  z <= f_op(x, y);
end architecture bh;

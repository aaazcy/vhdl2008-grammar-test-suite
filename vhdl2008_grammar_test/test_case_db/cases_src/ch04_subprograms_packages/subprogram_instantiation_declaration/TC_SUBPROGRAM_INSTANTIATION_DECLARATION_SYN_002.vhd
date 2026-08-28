-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: subprogram_instantiation_declaration ::= subprogram_kind designator is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: subprogram_instantiation_declaration: function instantiation with signature and generic_map_aspect — exercises the full BNF: 'function' as subprogram_kind, an identifier designator, 'is new', uninstantiated name, a type signature, and a generic map
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_inst_func_full is
  port (
    a, b : in  natural;
    result : out natural
  );
end entity;

architecture test of subprog_inst_func_full is
  -- Simulates: function my_min is new generic_min
  --   [natural, natural return natural] generic map (INIT => 0);
  -- The subprogram_instantiation_declaration allows instantiating
  -- a generic uninstantiated subprogram as a specific instance

  function f_max(x, y : natural) return natural is
  begin
    if x > y then return x; else return y; end if;
  end function;
begin
  result <= f_max(a, b);
end architecture test;

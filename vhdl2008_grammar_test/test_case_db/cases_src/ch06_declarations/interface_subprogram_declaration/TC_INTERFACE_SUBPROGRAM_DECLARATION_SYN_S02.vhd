-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_declaration ::= interface_subprogram_specification [ is interface_subprogram_default ]
-- Case Type: Positive
-- Test Focus: Production-specific: interface_subprogram_declaration with default subprogram name specified.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_subprog_decl_syn_s2 is
  port (
    a, b : in  integer;
    result : out integer
  );
end entity interface_subprog_decl_syn_s2;

architecture rtl of interface_subprog_decl_syn_s2 is
  function default_op(x, y : integer) return integer is
  begin
    return x + y;
  end function;

  function compute(x, y : integer) return integer is
  begin
    return x * y + 1;
  end function;
begin
  result <= compute(a, b);
end architecture rtl;

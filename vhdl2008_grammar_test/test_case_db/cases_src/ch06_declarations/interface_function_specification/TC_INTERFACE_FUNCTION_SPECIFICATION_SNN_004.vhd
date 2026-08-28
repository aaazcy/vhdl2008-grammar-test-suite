-- =============================================================
-- Case ID: TC_INTERFACE_FUNCTION_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_function_specification ::= [ pure | impure ] function designator [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Negative
-- Test Focus: missing designator — the BNF requires 'function designator', but the designator identifier is omitted after 'function'
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: designator missing after 'function' keyword
entity ifunc_spec_e4 is
  generic (
    g_bad : function (a : integer) return integer
  );
  port (
    result : out integer
  );
end entity ifunc_spec_e4;

architecture bh of ifunc_spec_e4 is
begin
  result <= 0;
end architecture bh;

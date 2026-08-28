-- =============================================================
-- Case ID: TC_INTERFACE_FUNCTION_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_function_specification ::= [ pure | impure ] function designator [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Negative
-- Test Focus: missing 'return' keyword — the BNF requires 'return type_mark', but 'return' is omitted before the type
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: 'return' keyword omitted before type_mark 'integer'
entity ifunc_spec_e1 is
  generic (
    g_bad : function broken_func (x : integer) integer
  );
  port (
    result : out integer
  );
end entity ifunc_spec_e1;

architecture bh of ifunc_spec_e1 is
begin
  result <= 0;
end architecture bh;

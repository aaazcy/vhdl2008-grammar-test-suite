-- =============================================================
-- Case ID: TC_INTERFACE_FUNCTION_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_function_specification ::= [ pure | impure ] function designator [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Positive
-- Test Focus: impure function generic with parameter keyword and formal_parameter_list, return type_mark
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ifunc_spec_syn3 is
  generic (
    impure function accumulate ( constant x : in integer; constant y : in integer ) return integer
  );
  port (
    a, b   : in  integer;
    result : out integer
  );
end entity ifunc_spec_syn3;

architecture bh of ifunc_spec_syn3 is
begin
  result <= accumulate(a, b);
end architecture bh;

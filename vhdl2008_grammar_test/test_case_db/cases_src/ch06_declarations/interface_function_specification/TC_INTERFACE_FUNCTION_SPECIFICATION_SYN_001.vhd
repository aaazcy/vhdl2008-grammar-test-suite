-- =============================================================
-- Case ID: TC_INTERFACE_FUNCTION_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_function_specification ::= [ pure | impure ] function designator [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Positive
-- Test Focus: pure function generic with designator only, no parameters, return type_mark — minimal form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ifunc_spec_syn1 is
  generic (
    pure function get_seed return natural
  );
  port (
    result : out natural
  );
end entity ifunc_spec_syn1;

architecture bh of ifunc_spec_syn1 is
begin
  result <= 0;
end architecture bh;

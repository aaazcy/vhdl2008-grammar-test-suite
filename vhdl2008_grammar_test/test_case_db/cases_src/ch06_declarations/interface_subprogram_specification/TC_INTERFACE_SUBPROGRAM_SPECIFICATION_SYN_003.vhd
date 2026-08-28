-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_specification ::= interface_procedure_specification | interface_function_specification
-- Case Type: Positive
-- Test Focus: choosing the function_specification alternative — an impure function with parameter and formal_parameter_list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ispec_syn3 is
  generic (
    impure function hash ( constant key : in integer ) return integer
  );
  port (
    in_key   : in  integer;
    out_hash : out integer
  );
end entity ispec_syn3;

architecture bh of ispec_syn3 is
begin
  out_hash <= hash(in_key);
end architecture bh;

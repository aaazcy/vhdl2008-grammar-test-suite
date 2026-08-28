-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_specification ::= interface_procedure_specification | interface_function_specification
-- Case Type: Negative
-- Test Focus: neither procedure_specification nor function_specification — a lone identifier 'foobar' is not prefixed by 'procedure' or 'function', matching neither alternative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: 'foobar' alone is neither a procedure_specification nor a
-- function_specification — missing both 'procedure' and 'function' keywords.
entity ispec_e1 is
  generic (
    g_bad : foobar ( x : in integer )
  );
  port (
    result : out integer
  );
end entity ispec_e1;

architecture bh of ispec_e1 is
begin
  result <= 0;
end architecture bh;

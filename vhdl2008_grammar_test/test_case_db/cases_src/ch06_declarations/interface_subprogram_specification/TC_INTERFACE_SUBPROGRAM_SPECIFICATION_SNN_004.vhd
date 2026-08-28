-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_specification ::= interface_procedure_specification | interface_function_specification
-- Case Type: Negative
-- Test Focus: the keyword 'signal' appears where 'procedure' or 'function' is expected — not a valid start for either alternative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: 'signal' is not a valid start for any
-- interface_subprogram_specification alternative (needs 'procedure' or 'function').
entity ispec_e4 is
  generic (
    g_bad : signal x : integer
  );
  port (
    result : out integer
  );
end entity ispec_e4;

architecture bh of ispec_e4 is
begin
  result <= 0;
end architecture bh;

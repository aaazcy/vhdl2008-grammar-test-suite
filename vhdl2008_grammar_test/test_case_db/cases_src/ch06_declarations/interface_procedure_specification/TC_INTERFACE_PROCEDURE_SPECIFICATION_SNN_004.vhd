-- =============================================================
-- Case ID: TC_INTERFACE_PROCEDURE_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_procedure_specification ::= procedure designator [ [ parameter ] ( formal_parameter_list ) ]
-- Case Type: Negative
-- Test Focus: missing 'procedure' keyword — the BNF requires 'procedure designator', but the keyword 'procedure' is omitted, leaving only the designator
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: 'procedure' keyword missing, only designator present
entity iproc_spec_e4 is
  generic (
    g_bad : my_handler ( signal a : in bit )
  );
  port (
    result : out bit
  );
end entity iproc_spec_e4;

architecture bh of iproc_spec_e4 is
begin
  result <= '0';
end architecture bh;

-- =============================================================
-- Case ID: TC_INTERFACE_PROCEDURE_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_procedure_specification ::= procedure designator [ [ parameter ] ( formal_parameter_list ) ]
-- Case Type: Negative
-- Test Focus: missing designator — the BNF requires 'procedure designator', but the designator identifier is omitted after 'procedure'
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

-- ERROR: designator missing after 'procedure' keyword
entity iproc_spec_e1 is
  generic (
    g_bad : procedure ( signal a : in bit )
  );
  port (
    result : out bit
  );
end entity iproc_spec_e1;

architecture bh of iproc_spec_e1 is
begin
  result <= '0';
end architecture bh;

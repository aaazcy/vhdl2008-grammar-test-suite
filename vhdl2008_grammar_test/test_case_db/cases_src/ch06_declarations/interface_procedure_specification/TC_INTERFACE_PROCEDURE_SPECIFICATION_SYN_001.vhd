-- =============================================================
-- Case ID: TC_INTERFACE_PROCEDURE_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_procedure_specification ::= procedure designator [ [ parameter ] ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure generic with designator only, no parameters — minimal form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity iproc_spec_syn1 is
  generic (
    procedure tick
  );
  port (
    clk_out : out bit
  );
end entity iproc_spec_syn1;

architecture bh of iproc_spec_syn1 is
  signal toggle : bit := '0';
begin
  tick;
  clk_out <= toggle;
end architecture bh;

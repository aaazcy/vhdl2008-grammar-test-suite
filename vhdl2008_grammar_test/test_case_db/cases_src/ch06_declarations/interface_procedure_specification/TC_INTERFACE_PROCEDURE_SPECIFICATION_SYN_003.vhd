-- =============================================================
-- Case ID: TC_INTERFACE_PROCEDURE_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_procedure_specification ::= procedure designator [ [ parameter ] ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure generic with parameter keyword and full formal_parameter_list including signal and variable parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity iproc_spec_syn3 is
  generic (
    procedure transfer ( signal src : in integer; variable dst : out integer )
  );
  port (
    din  : in  integer;
    dout : out integer
  );
end entity iproc_spec_syn3;

architecture bh of iproc_spec_syn3 is
begin
  process
    variable v : integer;
  begin
    transfer(din, v);
    dout <= v;
    wait;
  end process;
end architecture bh;

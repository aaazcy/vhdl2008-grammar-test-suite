-- =============================================================
-- Case ID: TC_SEM_INTERFACE_PROCEDURE_SPECIFICATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_procedure_specification ::= procedure designator [ [ parameter ] ( formal_parameter_list ) ]
-- Case Type: Negative (Semantic)
-- Test Focus: generic procedure interface declares a parameter as 'variable' mode, but the associated default procedure declares it as 'signal' mode — mode mismatch
-- Expected Result: Triggers semantic error (parameter class/mode mismatch)
-- Dependencies: None
-- =============================================================

-- ERROR: generic procedure expects 'variable dst' but default
-- procedure 'bump' declares 'signal dst' — mode class mismatch.
entity iproc_spec_sem1 is
  generic (
    g_bump : procedure bump ( constant inc : in integer; variable dst : out integer )
  );
  port (
    inc_val : in  integer;
    out_val : out integer
  );
end entity iproc_spec_sem1;

architecture bh of iproc_spec_sem1 is
  procedure bump ( constant inc : in integer; signal dst : out integer ) is
  begin
    dst <= inc + 1;
  end procedure;
  signal s : integer := 0;
begin
  process
    variable v : integer;
  begin
    g_bump(inc_val, v);
    out_val <= v;
    wait;
  end process;
end architecture bh;

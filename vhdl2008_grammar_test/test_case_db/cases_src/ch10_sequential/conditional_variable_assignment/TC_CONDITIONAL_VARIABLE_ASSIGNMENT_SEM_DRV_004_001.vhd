-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SEM_DRV_004_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_004
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: Conditions in conditional variable assignment must be of type BOOLEAN
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: Negative example: the when condition `a` is integer instead of BOOLEAN, verifying the analyzer detects that conditions in conditional_variable_assignment must be BOOLEAN type
-- Expected Result: Triggers semantic error: condition must be BOOLEAN type
-- Dependencies: None
-- =============================================================
entity cva_sem1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of cva_sem1_ent is signal s_res:integer:=0;
begin
  process(a)
    variable v_res:integer;
  begin
    v_res := 100 when a else 0;
    s_res <= v_res;
    y <= s_res;
  end process;
end architecture bh;

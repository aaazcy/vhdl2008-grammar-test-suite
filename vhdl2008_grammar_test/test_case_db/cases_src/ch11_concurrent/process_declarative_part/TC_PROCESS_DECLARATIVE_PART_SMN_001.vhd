-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_PROC_PART_DUPLICATE
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Duplicate identifiers in process declarative part
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: duplicate variable names in process declarative part
-- Expected Result: Triggers semantic error: duplicate declaration
-- Dependencies: None
-- =============================================================
entity proc_part_smn1_ent is port(y:out integer); end entity;
architecture bh of proc_part_smn1_ent is
begin
  process is
    variable v:integer:=0;
    variable v:integer:=1;
  begin
    y<=v; wait;
  end process;
end architecture bh;

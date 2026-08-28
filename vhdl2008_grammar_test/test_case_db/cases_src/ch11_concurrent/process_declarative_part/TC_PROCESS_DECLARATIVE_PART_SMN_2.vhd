-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_PROC_PART_DUP_DECL
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Declarations in a process declarative part must have unique names
-- Case Type: Negative
-- Error Category: duplicate_declaration
-- Test Focus: SEM: process declarative part declaring the same-named variable twice——variable v appears twice; variable names must be unique within one declarative region
-- Expected Result: Triggers analysis error: identifier "v" already used for a declaration
-- Dependencies: None
-- =============================================================
entity proc_part_dup_var is port(y:out integer); end entity;
architecture vhdl2008 of proc_part_dup_var is
begin
  process is
    variable v:integer:=0;
    variable v:integer:=1;
  begin
    y<=v;
    wait;
  end process;
end architecture vhdl2008;

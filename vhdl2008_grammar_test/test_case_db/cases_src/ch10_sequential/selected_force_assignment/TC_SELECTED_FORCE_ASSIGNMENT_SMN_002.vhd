-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Rule Description: Type of select expression must match type of choices in selected_expressions
-- Case Type: Negative
-- Test Focus: Type mismatch -- integer select expression with character choices in when clauses should fail type check
-- Expected Result: Triggers semantic error: type mismatch between select expression and choices
-- Dependencies: None
-- =============================================================
entity sel_force_smn_002 is
end entity sel_force_smn_002;

architecture test of sel_force_smn_002 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel select s_target <= force
      10 when 'A',  -- ERROR: character choice on integer select expression
      20 when others;
    wait;
  end process;
end architecture test;

-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_variable_assignment ::= with expression select [ ? ] target := selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected variable assignment with 4 branches: target v_op selects among 4 operation results via with-select based on opcode, verifying the multi-branch selected_expressions of selected_variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_syn2_ent is port(opcode:in integer range 0 to 3; a,b:in integer; y:out integer); end entity;
architecture bh of sva_syn2_ent is signal s_res:integer:=0;
begin
  process(opcode,a,b)
    variable v_op:integer;
  begin
    with opcode select v_op :=
      a + b when 0,
      a - b when 1,
      a * b when 2,
      0     when 3;
    s_res <= v_op;
    y <= s_res;
  end process;
end architecture bh;

-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_variable_assignment ::= with expression select [ ? ] target := selected_expressions ;
-- Case Type: Positive
-- Test Focus: Minimal form of selected variable assignment: target v_mux assigns a or b via with-select based on the bit selector sel, only 2 branches, verifying the minimal syntax of VHDL 2008 selected_variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_syn1_ent is port(sel:in bit; a,b:in integer; y:out integer); end entity;
architecture bh of sva_syn1_ent is signal s_res:integer:=0;
begin
  process(sel,a,b)
    variable v_mux:integer;
  begin
    with sel select v_mux :=
      a when '0',
      b when '1';
    s_res <= v_mux;
    y <= s_res;
  end process;
end architecture bh;

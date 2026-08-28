-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_variable_assignment ::= with expression select [ ? ] target := selected_expressions ;
-- Case Type: Negative
-- Test Focus: SNN: Missing terminating semicolon — `with sel select v_mux := a when '0', b when '1'`, a complete expression followed directly by `s_res <= v_mux;` without `;`, verifying that selected_variable_assignment requires semicolon termination
-- Expected Result: Triggers syntax error: missing ";" after selected variable assignment
-- Dependencies: None
-- =============================================================
entity sva_snn4_ent is port(sel:in bit; a,b:in integer; y:out integer); end entity;
architecture bh of sva_snn4_ent is signal s_res:integer:=0;
begin
  process(sel,a,b)
    variable v_mux:integer;
  begin
    with sel select v_mux := a when '0', b when '1'
    s_res <= v_mux;
    y <= s_res;
  end process;
end architecture bh;

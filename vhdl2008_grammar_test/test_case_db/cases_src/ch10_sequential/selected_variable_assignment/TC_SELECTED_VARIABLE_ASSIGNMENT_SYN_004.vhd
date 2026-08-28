-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_variable_assignment ::= with expression select [ ? ] target := selected_expressions ;
-- Case Type: Positive
-- Test Focus: VHDL 2008 matching selected variable assignment: with-select? uses the matching select form, the selector is bit_vector(1 downto 0), target v_mux selects 4 values through matching, verifying the matching select `?` form of selected_variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_syn4_ent is port(sel:in bit_vector(1 downto 0); a,b,c,d:in integer; y:out integer); end entity;
architecture bh of sva_syn4_ent is signal s_res:integer:=0;
begin
  process(sel,a,b,c,d)
    variable v_mux:integer;
  begin
    with sel select? v_mux :=
      a when "00",
      b when "01",
      c when "10",
      d when "11";
    s_res <= v_mux;
    y <= s_res;
  end process;
end architecture bh;

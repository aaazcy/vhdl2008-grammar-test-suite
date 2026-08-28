-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Rule Description: Variable declarations in a process create objects with process lifetime; their values persist across multiple invocations of the process, enabling accumulation and state tracking
-- Case Type: Positive
-- Test Focus: variable state persists across process invocations——v_accum accumulates on every clock edge and keeps its value across multiple process activations, verifying the persistent state semantics of process variables
-- Expected Result: Compiles successfully; variable retains value across process activations
-- Dependencies: None
-- =============================================================
entity pdi_sem2_ent is
  port(clk, rst_n : in bit; inc : in integer; total : out integer);
end entity pdi_sem2_ent;
architecture bh of pdi_sem2_ent is
begin
  process(clk, rst_n) is
    variable v_accum : integer := 0;
  begin
    if rst_n = '0' then
      v_accum := 0;
      total <= 0;
    elsif clk'event and clk = '1' then
      v_accum := v_accum + inc;
      total <= v_accum;
    end if;
  end process;
end architecture bh;

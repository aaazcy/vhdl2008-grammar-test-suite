-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: entity instantiation with architecture identifier — `entity work.dff(rtl)` explicitly names the architecture rtl, verifying that an architecture_identifier in parentheses may follow the entity_name to bind a specific architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_arch_sel_ent is
  port(clk, d : in bit; q : out bit);
end entity ci_arch_sel_ent;

entity dff is
  port(clk, d : in bit; q : out bit);
end entity dff;
architecture rtl of dff is
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then q <= d; end if;
  end process;
end architecture rtl;

architecture struct of ci_arch_sel_ent is
begin
  u_ff : entity work.dff(rtl)
    port map(clk => clk, d => d, q => q);
end architecture struct;

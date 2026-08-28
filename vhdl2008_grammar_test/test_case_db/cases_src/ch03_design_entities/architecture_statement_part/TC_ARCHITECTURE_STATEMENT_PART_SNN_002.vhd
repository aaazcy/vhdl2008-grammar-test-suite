-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: SNN: Component instantiation missing label - `dff port map(...)` lacks the instantiation_label and colon, verifying the label is mandatory when component_instantiation is used as a concurrent_statement
-- Expected Result: Triggers syntax error: missing instantiation label
-- Dependencies: None
-- =============================================================
entity asp_snn2_ent is port(clk,a:in bit; y:out bit); end entity;
architecture bh of asp_snn2_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
begin
  dff port map(clk=>clk,d=>a,q=>y);
end architecture bh;

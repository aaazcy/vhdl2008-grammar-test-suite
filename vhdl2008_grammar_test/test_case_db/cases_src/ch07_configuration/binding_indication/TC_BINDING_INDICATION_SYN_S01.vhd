-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Test Focus: Binding indication production-specific: exercises all three optional clauses simultaneously — "use entity work.xxx(arch) generic map(...) port map(...)" — demonstrating maximum binding_indication usage with generics and ports
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  generic (W : integer := 1; Tsu : time := 1 ns);
  port (clk : in bit; d : in bit; q : out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity bi_prod_specific is
  port(clk,d : in bit; q : out bit);
end entity;

architecture bh of bi_prod_specific is
  component dff is
    generic(W : integer := 1; Tsu : time := 1 ns);
    port(clk : in bit; d : in bit; q : out bit);
  end component;
  for u_dff : dff use entity work.dff(rtl)
    generic map(W => 1, Tsu => 300 ps)
    port map(clk => clk, d => d, q => q);
begin
  u_dff : dff port map(clk => clk, d => d, q => q);
end architecture bh;

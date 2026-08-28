-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Positive
-- Test Focus: Single-level upward reference——^.parent.sig uses one '^.' to reference a signal in the parent hierarchy level upwards, verifying the basic upward navigation syntax of a relative path
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_path_single_up is
  port(clk : in bit; synced : out bit);
end entity;

architecture vhdl2008 of rel_path_single_up is
  alias parent_clk is <<signal ^.clk_gen.clk : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= parent_clk; end if;
  end process;
  synced <= reg;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive
-- Test Focus: external_pathname selects the relative_pathname branch — in <<signal ^.uut.clk : bit>>, ^.uut.clk is in relative_pathname form (beginning with ^ to indicate one level up), verifying the syntax of the relative branch of external_pathname
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_path_rel_sel is
  port(lclk : in bit; synced : out bit);
end entity;

architecture vhdl2008 of ext_path_rel_sel is
  alias parent_clk is <<signal ^.uut.clk : bit>>;
  signal sreg : bit := '0';
begin
  process(lclk)
  begin
    if rising_edge(lclk) then sreg <= parent_clk; end if;
  end process;
  synced <= sreg;
end architecture vhdl2008;

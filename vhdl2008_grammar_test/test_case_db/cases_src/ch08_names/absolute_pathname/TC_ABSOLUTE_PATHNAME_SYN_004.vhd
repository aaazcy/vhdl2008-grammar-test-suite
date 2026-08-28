-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Test Focus: Minimal absolute pathname — a single-element partial_pathname (.top_clk), anchored at the root hierarchy by the dot, containing only one simple name of an object, used in a <<signal ...>> external name to access a top-level signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity abs_path_single_elem is
  port(sys_clk : in bit; synced_out : out bit);
end entity;

architecture vhdl2008 of abs_path_single_elem is
  alias top_clock is <<signal .top_clk : bit>>;
  signal sync_ff : bit := '0';
begin
  process(sys_clk)
  begin
    if rising_edge(sys_clk) then
      sync_ff <= top_clock;
    end if;
  end process;
  synced_out <= sync_ff;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Positive
-- Test Focus: Zero ^ references (equal to a partial_pathname)——^uut.sig has no upward reference; the minimal form of relative_pathname equals a partial_pathname, verifying that { ^ . } may repeat zero times
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_path_zero_up is
  port(clk : in bit; mon : out bit);
end entity;

architecture vhdl2008 of rel_path_zero_up is
  alias sibling_sig is <<signal uut.clk : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= sibling_sig; end if;
  end process;
  mon <= reg;
end architecture vhdl2008;

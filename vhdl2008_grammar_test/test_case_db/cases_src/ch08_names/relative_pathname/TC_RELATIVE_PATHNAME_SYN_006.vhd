-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Positive
-- Test Focus: Multi-level upward reference——^.^.^.grandparent.sig uses three '^.' to go up three hierarchy levels and access the grandparent-level signal, verifying the multi-level upward navigation syntax of repeated { ^ . }
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_path_multi_up is
  port(clk : in bit; captured : out integer);
end entity;

architecture vhdl2008 of rel_path_multi_up is
  alias deep_sig is <<signal ^.^.^.tb_top.cfg_val : integer>>;
  signal reg : integer := 0;
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= deep_sig; end if;
  end process;
  captured <= reg;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Positive
-- Test Focus: Upward reference followed by a multi-level partial_pathname——^.^.parent_gen.sub_block.register first goes up two levels and then down through the multi-level pathname_element chain of the partial_pathname to access the value of a deep register
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_path_up_then_down is
  port(clk : in bit; val : out bit_vector(7 downto 0));
end entity;

architecture vhdl2008 of rel_path_up_then_down is
  alias far_reg is <<signal ^.^.parent_gen.sub_block.reg_val : bit_vector(7 downto 0)>>;
  signal snap : bit_vector(7 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then snap <= far_reg; end if;
  end process;
  val <= snap;
end architecture vhdl2008;

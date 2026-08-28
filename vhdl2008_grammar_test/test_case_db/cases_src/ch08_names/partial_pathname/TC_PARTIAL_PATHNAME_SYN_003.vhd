-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Positive
-- Test Focus: Single-element partial_pathname——obj_name has no pathname_element prefix and forms a minimal partial_pathname directly from an object_simple_name, verifying the base form with zero repetitions of { pathname_element . }
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity part_path_single is
  port(clk : in bit; mon : out bit);
end entity;

architecture vhdl2008 of part_path_single is
  alias top_sig is <<signal .clk_gen : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= top_sig; end if;
  end process;
  mon <= reg;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Positive
-- Test Focus: All elements of a partial_pathname separated by dots——the three identifiers in the ent.arch.sig form are joined by two dots, verifying the core partial_pathname syntax: the dot separator rule of { elem . } obj
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity part_path_dot_chain is
  port(clk : in bit; val : out integer);
end entity;

architecture vhdl2008 of part_path_dot_chain is
  alias cfg_val is <<constant .tb_top.cfg_block.MAX_RETRY : integer>>;
  signal reg : integer := 0;
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= cfg_val; end if;
  end process;
  val <= reg;
end architecture vhdl2008;

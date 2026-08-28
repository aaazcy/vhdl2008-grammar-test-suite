-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_PARTIAL_PATHNAME_003
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Positive
-- Rule Description: In a partial_pathname each pathname_element resolves in hierarchical order, and the object_simple_name must be the last level of the path chain
-- Test Focus: Semantic positive case——the three-level partial_pathname .tb_top.u_core.status has the correct hierarchy order (top entity -> core instance -> status signal), and each level resolves legally to an actual declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity part_path_hier_valid is
  port(clk : in bit; resolved : out bit);
end entity;

architecture vhdl2008 of part_path_hier_valid is
  alias core_status is <<signal .tb_top.u_core.status_flag : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= core_status; end if;
  end process;
  resolved <= reg;
end architecture vhdl2008;

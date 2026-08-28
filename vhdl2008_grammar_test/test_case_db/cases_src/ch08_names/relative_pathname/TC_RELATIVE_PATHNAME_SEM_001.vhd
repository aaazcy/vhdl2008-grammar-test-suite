-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_RELATIVE_PATHNAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Positive
-- Rule Description: Each ^ in a relative_pathname navigates one level up the hierarchy, and the partial_pathname of the last level must be able to find the target downwards from that level
-- Test Focus: Semantic positive case——in ^.uut.status the path goes up one level from the current hierarchy to find the uut instance and then down to find the status signal; the full relative path resolves legally in the parent hierarchy
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_path_valid_sem is
  port(clk : in bit; mon : out bit);
end entity;

architecture vhdl2008 of rel_path_valid_sem is
  alias parent_en is <<signal ^.ctrl_unit.enable : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= parent_en; end if;
  end process;
  mon <= reg;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Positive
-- Test Focus: relative_pathname with single '^.' — '^.parent_sig' goes up one level in hierarchy then references parent_sig; exercises the single up-reference form in an external name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_path_single_ent is
  port(child_val : in bit_vector(3 downto 0); parent_match : out bit);
end entity;

architecture vhdl2008 of rel_path_single_ent is
  alias parent_data is <<signal ^.parent_unit.data_bus : bit_vector(3 downto 0)>>;
  signal match_reg : bit := '0';
begin
  process(child_val)
  begin
    if child_val = parent_data then
      match_reg <= '1';
    else
      match_reg <= '0';
    end if;
  end process;
  parent_match <= match_reg;
end architecture vhdl2008;

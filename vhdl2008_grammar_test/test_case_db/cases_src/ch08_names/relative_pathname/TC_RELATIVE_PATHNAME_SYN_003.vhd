-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Positive
-- Test Focus: relative_pathname with multiple '^.' — '^.^.grandparent_sig' goes up two levels in hierarchy; exercises the { ^ . } repetition form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_path_double_ent is
  port(local_val : in bit; gp_match : out bit);
end entity;

architecture vhdl2008 of rel_path_double_ent is
  alias gp_data is <<signal ^.^.grandparent_unit.ctrl_flag : bit>>;
  signal match_reg : bit := '0';
begin
  process(local_val)
  begin
    if local_val = gp_data then
      match_reg <= '1';
    else
      match_reg <= '0';
    end if;
  end process;
  gp_match <= match_reg;
end architecture vhdl2008;

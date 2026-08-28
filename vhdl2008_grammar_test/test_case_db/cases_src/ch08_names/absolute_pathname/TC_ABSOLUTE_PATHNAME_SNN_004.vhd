-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Negative
-- Test Focus: SNN: repeated leading dot — the external name uses a '..partial_pathname' double-dot prefix, but absolute_pathname allows only one leading dot ("." partial_pathname), so the double dot is illegal syntax
-- Expected Result: Triggers syntax error at double dot
-- Dependencies: None
-- =============================================================
entity abs_path_double_dot is
  port(trigger : in bit; flag_out : out bit);
end entity;

architecture vhdl2008 of abs_path_double_dot is
  -- ERROR: '..tb_top.uut.clk' has double leading dot - only one '.' allowed
  alias bad_ref is <<signal ..tb_top.uut.clk : bit>>;
begin
  process(trigger)
  begin
    if rising_edge(trigger) then
      flag_out <= bad_ref;
    end if;
  end process;
end architecture vhdl2008;

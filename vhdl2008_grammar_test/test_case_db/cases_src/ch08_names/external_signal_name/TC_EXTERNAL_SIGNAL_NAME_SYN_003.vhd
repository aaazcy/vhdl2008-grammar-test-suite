-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External signal name with relative pathname — <<signal ^.parent_inst.data_bus : bit_vector(7 downto 0)>> uses relative pathname (^.) to reference a signal one level up in hierarchy
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_rel_mon is
  port(local_data : in bit_vector(7 downto 0); data_match : out bit);
end entity;

architecture vhdl2008 of ext_sig_rel_mon is
  alias parent_bus is <<signal ^.parent_unit.bus_out : bit_vector(7 downto 0)>>;
  signal match_reg : bit := '0';
begin
  process(local_data)
  begin
    if local_data = parent_bus then
      match_reg <= '1';
    else
      match_reg <= '0';
    end if;
  end process;
  data_match <= match_reg;
end architecture vhdl2008;

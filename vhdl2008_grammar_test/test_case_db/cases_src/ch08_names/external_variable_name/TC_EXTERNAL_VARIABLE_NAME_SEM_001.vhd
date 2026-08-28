-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_VARIABLE_NAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Rule Description: The target resolved by the external_variable_name path must be a variable, and the subtype_indication must be compatible with the target type
-- Test Focus: Positive semantic case — alias mon_cnt is <<variable .tb.pkt_mon.pkt_count : natural>>: the path correctly points to a shared variable of type natural, which is compared with a local counter in a process, verifying the correct semantic path with matching types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_var_valid_sem is
  port(local_cnt : in natural; differs : out bit);
end entity;

architecture vhdl2008 of ext_var_valid_sem is
  alias mon_cnt is <<variable .tb_top.pkt_mon.pkt_count : natural>>;
begin
  process(local_cnt)
  begin
    if local_cnt /= mon_cnt then differs <= '1';
    else differs <= '0'; end if;
  end process;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External variable name used for scoreboard comparison — in the checker process an alias binds a cross-hierarchy scoreboard variable, which is compared with the local golden model output, verifying the practical usability of external_variable_name in a verification scenario
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_var_scoreboard is
  port(dut_out : in bit_vector(7 downto 0); mismatch : out bit);
end entity;

architecture vhdl2008 of ext_var_scoreboard is
  alias expected_data is <<variable .tb_top.scoreboard.exp_val : bit_vector(7 downto 0)>>;
begin
  process(dut_out)
  begin
    if dut_out /= expected_data then mismatch <= '1';
    else mismatch <= '0'; end if;
  end process;
end architecture vhdl2008;

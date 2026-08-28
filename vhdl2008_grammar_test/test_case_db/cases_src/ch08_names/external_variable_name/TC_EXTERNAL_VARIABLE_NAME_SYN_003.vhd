-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External variable name with absolute pathname — <<variable .tb_top.scoreboard.error_count : natural>> uses absolute pathname to reference a variable deep in testbench hierarchy
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_var_abs_mon is
  port(threshold : in natural; alert : out bit);
end entity;

architecture vhdl2008 of ext_var_abs_mon is
  alias err_cnt is <<variable .tb_top.scoreboard.error_count : natural>>;
  signal alert_reg : bit := '0';
begin
  process(threshold)
  begin
    if err_cnt > threshold then
      alert_reg <= '1';
    else
      alert_reg <= '0';
    end if;
  end process;
  alert <= alert_reg;
end architecture vhdl2008;

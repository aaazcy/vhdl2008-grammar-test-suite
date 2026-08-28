-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: condition_operator
-- IEEE Section: 9.2.1
-- BNF Text: condition_operator ::= ??
-- Test Focus: ?? operator converting bit to boolean in an if-statement condition (VHDL 2008 feature)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_condition_operator_syn_s01 is
  port (
    flag_in   : in  bit;
    enable    : out bit
  );
end entity tc_condition_operator_syn_s01;

architecture converter of tc_condition_operator_syn_s01 is
begin
  process(flag_in)
  begin
    if ?? flag_in then   -- ?? converts bit to boolean
      enable <= '1';
    else
      enable <= '0';
    end if;
  end process;
end architecture converter;

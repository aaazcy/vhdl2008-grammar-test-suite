-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: condition_operator ?? in an if condition context: ?? applied to a std_ulogic signal, with the conversion result as boolean used for branch selection
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_cond_if_ent is
  port(status_flag : in bit; active : out bit);
end entity;
architecture rtl of expr_cond_if_ent is
begin
  process(status_flag)
  begin
    if ?? status_flag then
      active <= '1';
    else
      active <= '0';
    end if;
  end process;
end architecture rtl;

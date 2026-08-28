-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: Two independent processes coexisting in the same architecture body — a registered process with clock/reset drives q_reg via if-elsif edge detection while a combinatorial process with a,b in its sensitivity list drives q_comb via and-gate logic, verifying that multiple process_statement instances coexist as concurrent statements without interaction
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_multi_ent is
  port(clk, rst_n, a, b : in bit; q_reg, q_comb : out bit);
end entity proc_multi_ent;
architecture bh of proc_multi_ent is
begin
  p_reg : process(clk, rst_n) is
    variable v_stable : bit := '0';
  begin
    if rst_n = '0' then
      q_reg <= '0';
      v_stable := '0';
    elsif clk'event and clk = '1' then
      v_stable := a;
      q_reg <= v_stable;
    end if;
  end process p_reg;

  process(a, b)
  begin
    if a = '1' and b = '1' then
      q_comb <= '1';
    else
      q_comb <= '0';
    end if;
  end process;
end architecture bh;

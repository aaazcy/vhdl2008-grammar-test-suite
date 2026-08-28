-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: testbench-style wait for + wait until — a clock generator uses wait for and wait until to achieve periodic signal generation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wait_tb_style_ent is
  port (
    clk_o    : out bit;
    reset_o  : out bit
  );
end entity wait_tb_style_ent;

architecture testbench of wait_tb_style_ent is
begin
  clk_gen: process is
  begin
    clk_o <= '0';
    wait for 5 ns;
    clk_o <= '1';
    wait for 5 ns;
  end process clk_gen;

  rst_gen: process is
  begin
    reset_o <= '1';
    wait for 30 ns;
    reset_o <= '0';
    wait;
  end process rst_gen;
end architecture testbench;

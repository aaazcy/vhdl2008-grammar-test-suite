-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: All elements label + report + severity: with label and both optional clauses report and severity, verifying the complete syntax of assertion_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_stmt_full_ent is
  port (
    clk   : in  bit;
    rst_n : in  bit;
    state : out integer range 0 to 3
  );
end entity assert_stmt_full_ent;

architecture fsm of assert_stmt_full_ent is
  signal s_count : integer range 0 to 3 := 0;
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      reset_check: assert rst_n = '1'
        report "FSM reset active at count=" & integer'image(s_count)
        severity warning;
      if rst_n = '0' then
        s_count <= 0;
      elsif s_count < 3 then
        s_count <= s_count + 1;
      end if;
    end if;
  end process;
  state <= s_count;
end architecture fsm;

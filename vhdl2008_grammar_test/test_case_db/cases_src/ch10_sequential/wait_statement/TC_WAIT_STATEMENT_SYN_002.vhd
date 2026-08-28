-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Positive
-- Test Focus: With sensitivity_clause: `wait on clk;` — verifying that wait can carry the on sensitivity signal list clause to achieve edge waiting
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wait_on_signal_ent is
  port (
    clk   : in  bit;
    count : out integer range 0 to 7
  );
end entity wait_on_signal_ent;

architecture counter of wait_on_signal_ent is
begin
  process is
    variable v_cnt : integer range 0 to 7 := 0;
  begin
    wait on clk;
    if clk = '1' then
      v_cnt := (v_cnt + 1) mod 8;
    end if;
    count <= v_cnt;
  end process;
end architecture counter;

-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_012
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: WAIT not permitted in process with sensitivity list — negative variant
-- Case Type: Negative
-- Error Category: semantic_error
-- Test Focus: SMN: Using wait on inside process(clk, rst) — wait still cannot be used in a sensitivity list with multiple signals
-- Expected Result: Triggers semantic error: wait not allowed in process with sensitivity list
-- Dependencies: None
-- =============================================================
entity wait_sens2_proc_ent is
  port (
    clk   : in  bit;
    rst_n : in  bit;
    q     : out integer
  );
end entity wait_sens2_proc_ent;

architecture smn of wait_sens2_proc_ent is
  signal s_q : integer := 0;
begin
  process(clk, rst_n) is  -- multi-signal sensitivity list
  begin
    if rst_n = '0' then
      s_q <= 0;
    else
      s_q <= s_q + 1;
    end if;
    wait on clk;  -- ERROR: wait in process with sensitivity list
  end process;
  q <= s_q;
end architecture smn;

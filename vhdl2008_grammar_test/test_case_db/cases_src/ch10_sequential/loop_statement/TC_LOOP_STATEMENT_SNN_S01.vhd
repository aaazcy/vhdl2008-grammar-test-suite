-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Test Focus: loop_statement: for loop missing "in"
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ls_e is port(r:out integer); end entity;
architecture bh of ls_e is
  signal s:integer:=0;
begin
  process is begin
    for i 0 to 7 loop  -- ERROR: missing "in"
      s<=s+i;
    end loop;
    wait;
  end process;
end architecture;

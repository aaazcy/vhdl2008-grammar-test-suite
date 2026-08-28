-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Test Focus: case_statement: missing "when" before choices
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity cs_e is port(r:out integer); end entity;
architecture bh of cs_e is
  signal s:integer range 0 to 1:=0;
begin
  process(s) is begin
    case s is
      0 => r<=0;  -- ERROR: missing "when"
      1 => r<=1;
    end case;
  end process;
end architecture;
